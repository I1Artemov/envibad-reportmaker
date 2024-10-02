using EnviBad.ReportMaker.Common.Models;
using Microsoft.EntityFrameworkCore;

namespace EnviBad.ReportMaker.Infrastructure.Contexts
{
    public class EnviBadReportContext : DbContext
    {
        public EnviBadReportContext(DbContextOptions options) : base(options)
        { }

        public DbSet<ValuableGeoObject> ValuableGeoObjects { get; set; }
        public DbSet<EnviReportResult> EnviReportResults { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
        }
    }
}
