using EnviBad.ReportMaker.Common.Models;
using EnviBad.ReportMaker.Infrastructure.Contexts;
using EnviBad.ReportMaker.Infrastructure.Interfaces;

namespace EnviBad.ReportMaker.Infrastructure.Repositories
{
    public class EnviReportResultRepo : EFRepo<EnviReportResult, EnviBadReportContext>, IEnviReportResultRepo
    {
        public EnviReportResultRepo(EnviBadReportContext context) : base(context)
        {
        }
    }
}
