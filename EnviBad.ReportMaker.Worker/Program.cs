using EnviBad.ReportMaker.Core.MqConsumers;
using MassTransit;

namespace EnviBad.ReportMaker.Worker
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Report Consumer started.");

            IBusControl busControl = Bus.Factory.CreateUsingRabbitMq(cfg =>
            {
                // TODO: Get from options
                cfg.Host("127.0.0.1", 5672, "/envibad", h =>
                {
                    h.Username("mq");
                    h.Password("123");
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
