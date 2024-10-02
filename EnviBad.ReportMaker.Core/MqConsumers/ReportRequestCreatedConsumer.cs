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

        /// <summary>
        /// Обработка запроса на формирование отчета по области, поступившего из RabbitMQ
        /// </summary>
        /// <param name="context">Сообщение с параметрами создания отчета (кто запросил, какая область, ...)</param>
        public async Task Consume(ConsumeContext<ReportRequestCreated> context)
        {
            var jsonMessage = JsonConvert.SerializeObject(context.Message);
            Console.WriteLine($"Got ReportRequestCreated message: {jsonMessage}");

            // Подготовка отчета. Если не удалось - сообщаем ошибочный статус запроса через API
            EnviReportResult preparedReport = _reportMaker.GetReport(context.Message);
            if (!string.IsNullOrEmpty(preparedReport?.ErrorMessage)) {
                ReportRequestUpdateDto errorUpdParameters = getFailedReportUpdateMessage(context.Message, preparedReport);
                await _enviBadApiExchanger.UpdateReportRequestAsync(errorUpdParameters);
                return;
            }

            // Сохранение успешно созданного отчета в базу данных
            string? saveError = _reportMaker.SaveReportResultToDb(preparedReport);
            if (!string.IsNullOrEmpty(saveError))
            {
                ReportRequestUpdateDto dbErrorParameters = getFailedReportUpdateMessage(context.Message, preparedReport);
                await _enviBadApiExchanger.UpdateReportRequestAsync(dbErrorParameters);
                Console.WriteLine($"Error saving report for message: {jsonMessage}");
            }

            // Если отчет удалось сформировать и сохранитб в БД, сообщаем успешный статус по API
            ReportRequestUpdateDto updParameters = getSuccessfullReportUpdateMessage(context.Message, preparedReport);
            await _enviBadApiExchanger.UpdateReportRequestAsync(updParameters);
            Console.WriteLine($"Successfully handled ReportRequestCreated message: {jsonMessage}");
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

        private ReportRequestUpdateDto getSuccessfullReportUpdateMessage(
            ReportRequestCreated consumedMessage, EnviReportResult preparedReport)
        {
            return new ReportRequestUpdateDto
            {
                ReportRequestId = consumedMessage.Id,
                Status = ReportStatus.Completed.ToString(),
                ResultId = preparedReport.Id?.ToString(),
                ExecDuration = preparedReport?.CreationDurationSec
            };
        }
    }
}
