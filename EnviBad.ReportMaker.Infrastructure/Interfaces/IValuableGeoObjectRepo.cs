using EnviBad.ReportMaker.Common.Models;
using EnviBad.ReportMaker.Infrastructure.Contexts;

namespace EnviBad.ReportMaker.Infrastructure.Interfaces
{
    public interface IValuableGeoObjectRepo : IEFRepo<ValuableGeoObject, EnviBadReportContext>
    {
    }
}
