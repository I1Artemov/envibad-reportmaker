﻿using EnviBad.ReportMaker.Common.Models.Options;
using EnviBad.ReportMaker.Core.MqConsumers;
using MassTransit;
using Microsoft.Extensions.Configuration;

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
                    e.Consumer<ReportRequestCreatedConsumer>();
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
