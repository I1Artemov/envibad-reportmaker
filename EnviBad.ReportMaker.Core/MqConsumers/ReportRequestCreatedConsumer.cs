using EnviBad.ReportMaker.Infrastructure.Interfaces;
using EnviBad.Shared.Models.MqMessages;
using MassTransit;
using Newtonsoft.Json;

namespace EnviBad.ReportMaker.Core.MqConsumers
{
    /// <summary>
    /// Обработчик сообщений из MQ о создании нового отчета на обработку
    /// </summary>
    public class ReportRequestCreatedConsumer : IConsumer<ReportRequestCreated>
    {
        private readonly IEnviBadApiExchanger _enviBadApiExchanger;

        public ReportRequestCreatedConsumer(IEnviBadApiExchanger enviBadApiExchanger)
        {
            _enviBadApiExchanger = enviBadApiExchanger;
        }

        public async Task Consume(ConsumeContext<ReportRequestCreated> context)
        {
            var jsonMessage = JsonConvert.SerializeObject(context.Message);

            Console.WriteLine($"ReportRequestCreated message: {jsonMessage}");
        }
    }
}
