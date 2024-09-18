using EnviBad.ReportMaker.Common.Models;
using EnviBad.ReportMaker.Infrastructure.Contexts;
using EnviBad.ReportMaker.Infrastructure.Interfaces;

namespace EnviBad.ReportMaker.Infrastructure.Repositories
{
    public class ValuableGeoObjectRepo : EFRepo<ValuableGeoObject, EnviBadReportContext>, IValuableGeoObjectRepo
    {
        public ValuableGeoObjectRepo(EnviBadReportContext context) : base(context)
        {
        }
    }
}
