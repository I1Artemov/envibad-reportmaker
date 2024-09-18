using EnviBad.ReportMaker.Common.Models;
using EnviBad.Shared.Models.MqMessages;

namespace EnviBad.ReportMaker.Core.Interfaces
{
    /// <summary>
    /// Создание отчета по области с заданными параметрами (центр области + радиус)
    /// </summary>
    public interface IEnviReportMaker
    {
        public EnviReportResult GetReport(ReportRequestCreated reportParams);
    }
}
