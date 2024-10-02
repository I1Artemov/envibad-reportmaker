using EnviBad.ReportMaker.Common.Models;
using EnviBad.ReportMaker.Infrastructure.Contexts;

namespace EnviBad.ReportMaker.Infrastructure.Interfaces
{
    public interface IEnviReportResultRepo : IEFRepo<EnviReportResult, EnviBadReportContext>
    {
    }
}
