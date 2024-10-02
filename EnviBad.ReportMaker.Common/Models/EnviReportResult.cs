using System.ComponentModel.DataAnnotations.Schema;

namespace EnviBad.ReportMaker.Common.Models
{
    /// <summary>
    /// Результат оформления отчета по области
    /// </summary>
    public class EnviReportResult
    {
        public Guid? Id { get; set; }
        public DateTimeOffset? CreationDateTime { get; set; }
        public string? ErrorMessage { get; set; }
        public double? CreationDurationSec { get; set; }

        /// <summary>
        /// В БД найденные гео-объекты храним в виде JSON'а
        /// </summary>
        [NotMapped]
        public List<ValuableGeoObject>? FoundValuableObjects { get; set; }

        [Column(TypeName = "jsonb")]
        public string? FoundObjectsJson { get; set; }

        public int? GoodFactorsCount { get; set; }
        public int? BadFactorsCount { get; set; }
        public int? NeutralFactorsCount { get; set; }

        public EnviReportResult()
        {
            this.Id = Guid.NewGuid();
            this.CreationDateTime = DateTimeOffset.Now;
        }
    }
}
