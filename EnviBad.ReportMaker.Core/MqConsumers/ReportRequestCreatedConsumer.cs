using EnviBad.ReportMaker.Common;
using EnviBad.ReportMaker.Common.DTO;
using EnviBad.ReportMaker.Common.Models;
using EnviBad.ReportMaker.Core.ReportMakers;
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
        private readonly ValuableGeoObjectsReportMaker _reportMaker;

        public ReportRequestCreatedConsumer(IEnviBadApiExchanger enviBadApiExchanger, 
            ValuableGeoObjectsReportMaker reportMaker)
        {
            _enviBadApiExchanger = enviBadApiExchanger;
            _reportMaker = reportMaker;
        }

        public async Task Consume(ConsumeContext<ReportRequestCreated> context)
        {
            var jsonMessage = JsonConvert.SerializeObject(context.Message);
            Console.WriteLine($"Got ReportRequestCreated message: {jsonMessage}");

            EnviReportResult preparedReport = _reportMaker.GetReport(context.Message);
            if (!string.IsNullOrEmpty(preparedReport?.ErrorMessage)) {
                ReportRequestUpdateDto errorUpdParameters = getFailedReportUpdateMessage(context.Message, preparedReport);
                await _enviBadApiExchanger.UpdateReportRequestAsync(errorUpdParameters);
                return;
            }

            // TODO: Сохранение успешно созданного отчета в Mongo

            ReportRequestUpdateDto updParameters = getSuccessfullReportUpdateMessage(context.Message);
            await _enviBadApiExchanger.UpdateReportRequestAsync(updParameters);
            Console.WriteLine($"Handled ReportRequestCreated message: {jsonMessage}");
        }

        private ReportRequestUpdateDto getFailedReportUpdateMessage(
            ReportRequestCreated consumedMessage, EnviReportResult preparedReport)
        {
            return new ReportRequestUpdateDto
            {
                ReportRequestId = consumedMessage.Id,
                Status = ReportStatus.Failed.ToString(),
                ErrorDescription = preparedReport?.ErrorMessage,
                ExecDuration = preparedReport?.CreationDurationSec
            };
        }

        private ReportRequestUpdateDto getSuccessfullReportUpdateMessage(ReportRequestCreated consumedMessage)
        {
            return new ReportRequestUpdateDto
            {
                ReportRequestId = consumedMessage.Id,
                Status = ReportStatus.Completed.ToString(),
                ResultId = Guid.NewGuid().ToString() // TODO: Реальный ID результата из Mongo
            };
        }
    }
}
