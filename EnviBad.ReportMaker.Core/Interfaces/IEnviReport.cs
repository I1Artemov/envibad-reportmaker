using EnviBad.ReportMaker.Common.Models;

namespace EnviBad.ReportMaker.Core.Interfaces
{
    public interface IEnviReport
    {
        public EnviReportResult GetReport();
    }
}
