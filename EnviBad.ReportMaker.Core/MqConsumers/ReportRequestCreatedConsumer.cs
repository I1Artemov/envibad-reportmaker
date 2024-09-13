using EnviBad.ReportMaker.Common;
using EnviBad.ReportMaker.Common.DTO;
using EnviBad.ReportMaker.Infrastructure.Interfaces;
using EnviBad.Shared.Models.MqMessages;
using MassTransit;
using Newtonsoft.Json;
using static MassTransit.ValidationResultExtensions;

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
            Console.WriteLine($"Got ReportRequestCreated message: {jsonMessage}");

            ReportRequestUpdateDto updParameters = new ReportRequestUpdateDto
            {
                ReportRequestId = context.Message.Id,
                Status = ReportStatus.Completed.ToString(),
                ResultId = Guid.NewGuid().ToString() // TODO: Реальный ID результата из Mongo
            };

            await _enviBadApiExchanger.UpdateReportRequestAsync(updParameters);
            Console.WriteLine($"Handled ReportRequestCreated message: {jsonMessage}");
        }
    }
}
