using EnviBad.ReportMaker.Common.Models.Options;
using EnviBad.ReportMaker.Core.MqConsumers;
using EnviBad.ReportMaker.Core.ReportMakers;
using EnviBad.ReportMaker.Infrastructure.Contexts;
using EnviBad.ReportMaker.Infrastructure.Interfaces;
using EnviBad.ReportMaker.Infrastructure.MicroserviceExchangers;
using EnviBad.ReportMaker.Infrastructure.Repositories;
using MassTransit;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Npgsql;

namespace EnviBad.ReportMaker.Worker
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Report Consumer started.");
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false);
            IConfiguration config = builder.Build();


            ServiceCollection services = new ServiceCollection();
            services.Configure<EnviBadApiConnectionOptions>(config.GetSection("EnviBadApiConnection"));
            services.AddTransient<IEnviBadApiExchanger, EnviBadApiExchanger>();
            services.AddTransient<ValuableGeoObjectsReportMaker, ValuableGeoObjectsReportMaker>();
            services.AddHttpClient();

            string? connectionStr = config.GetConnectionString("EnviBadPostgres");
            var dsBuilder = new NpgsqlDataSourceBuilder(connectionStr);
            var dbDataSource = dsBuilder.Build();
            services.AddDbContext<EnviBadReportContext>(options =>
            {
                options.UseNpgsql(dbDataSource);
            });

            services.AddScoped<IValuableGeoObjectRepo, ValuableGeoObjectRepo>();

            ServiceProvider serviceProvider = services.BuildServiceProvider();

            var rabbitSettings = config.GetSection("MassTransitOptions").Get<MassTransitOptions>();
            IBusControl busControl = Bus.Factory.CreateUsingRabbitMq(cfg =>
            {
                // TODO: Get from options
                cfg.Host(rabbitSettings?.RabbitHost, rabbitSettings?.RabbitPort ?? 5672, "/envibad", h =>
                {
                    h.Username(rabbitSettings?.RabbitUser ?? "guest");
                    h.Password(rabbitSettings?.RabbitPassword ?? "guest");
                });

                cfg.ReceiveEndpoint("report-request-created-event", e =>
                {
                    e.Consumer(() => new ReportRequestCreatedConsumer(
                        serviceProvider.GetService<IEnviBadApiExchanger>(),
                        serviceProvider.GetService<ValuableGeoObjectsReportMaker>()
                    ));
                });
            });

            await busControl.StartAsync(new CancellationToken());
            try
            {
                Console.WriteLine("Press enter to exit");
                await Task.Run(() => Console.ReadLine());
            }
            finally
            {
                await busControl.StopAsync();
            }
        }
    }
}
