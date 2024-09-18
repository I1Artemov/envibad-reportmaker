namespace EnviBad.ReportMaker.Common.Models
{
    /// <summary>
    /// Результат оформления отчета по области
    /// </summary>
    public class EnviReportResult
    {
        public string? ErrorMessage { get; set; }
        public double? CreationDurationSec { get; set; }
        public List<ValuableGeoObject>? FoundValuableObjects { get; set; }
        public int? GoodFactorsCount { get; set; }
        public int? BadFactorsCount { get; set; }
        public int? NeutralFactorsCount { get; set; }
    }
}
