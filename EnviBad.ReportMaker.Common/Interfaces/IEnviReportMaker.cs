using EnviBad.ReportMaker.Common.Models;
using EnviBad.Shared.Models.MqMessages;

namespace EnviBad.ReportMaker.Core.Interfaces
{
    /// <summary>
    /// Создание отчета по области с заданными параметрами (центр области + радиус)
    /// </summary>
    public interface IEnviReportMaker
    {
        /// <summary>
        /// Формирует отчет по гео-обхектам, которые сможет найти в области
        /// </summary>
        /// <param name="reportParams">Параметры создания отчета (основные - центр области и ее радиус)</param>
        public EnviReportResult GetReport(ReportRequestCreated reportParams);

        /// <summary>
        /// Сохранение готового сформированного отчета по области в базу данных
        /// </summary>
        /// <param name="reportResult">Готовый отчет с найденными гео-объектами и статистикой</param>
        /// <returns>Ошибка, если отчет не удалось сохранить, либо null, если все ОК</returns>
        public string? SaveReportResultToDb(EnviReportResult reportResult);
    }
}
