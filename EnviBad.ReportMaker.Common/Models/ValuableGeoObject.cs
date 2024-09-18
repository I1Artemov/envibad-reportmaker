namespace EnviBad.ReportMaker.Common.Models
{
    /// <summary>
    /// Гео-объект, имеющий значение для построения отчета (станции метро, очистные сооружения и т.п.)
    /// </summary>
    public class ValuableGeoObject
    {
        public int Id { get; set; }
        public DateTime? CreationDate { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public string? Address { get; set; }
        public string? Name { get; set; }

        /// <summary> Тип гео-объекта: "Общежитие", "Метро", ... </summary>
        public string? ObjectKind { get; set; }

        /// <summary> Вид влияния гео-объекта на область: BAD, GOOD, NEUTRAL </summary>
        public string? Influence { get; set; }
    }
}
