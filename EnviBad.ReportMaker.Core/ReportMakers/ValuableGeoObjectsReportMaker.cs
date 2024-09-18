using EnviBad.ReportMaker.Common;
using EnviBad.ReportMaker.Common.Models;
using EnviBad.ReportMaker.Core.Interfaces;
using EnviBad.ReportMaker.Infrastructure.Interfaces;
using EnviBad.Shared.Models.MqMessages;

namespace EnviBad.ReportMaker.Core.ReportMakers
{
    /// <summary>
    /// Класс для созданиия отчетов по гео-объектам с положительным и отрицательным влиянием на область
    /// </summary>
    public class ValuableGeoObjectsReportMaker : IEnviReportMaker
    {
        private readonly IValuableGeoObjectRepo _geoObjectsRepo;


        public ValuableGeoObjectsReportMaker(IValuableGeoObjectRepo geoObjectsRepo)
        {
            _geoObjectsRepo = geoObjectsRepo;
        }

        /// <inheritdoc />
        public EnviReportResult GetReport(ReportRequestCreated reportParams)
        {
            DateTime execStartDate = DateTime.Now;
            if (reportParams.CenterLat == null || reportParams.CenterLong == null || reportParams.AreaRadius == null)
                return new EnviReportResult {ErrorMessage = "Не заданы координаты или радиус области"};
            // TODO: Переделать на поиск в радиусе
            double minLat = reportParams.CenterLat.Value - reportParams.AreaRadius.Value;
            double maxLat = reportParams.CenterLat.Value + reportParams.AreaRadius.Value;
            double minLong = reportParams.CenterLong.Value - reportParams.AreaRadius.Value;
            double maxLong = reportParams.CenterLong.Value + reportParams.AreaRadius.Value;
            List<ValuableGeoObject> valuableObjectsInArea = null;
            try
            {
                valuableObjectsInArea = _geoObjectsRepo.GetAllWithoutTracking()
                    .Where(x => x.Latitude >= minLat && x.Latitude <= maxLat && x.Longitude >= minLong && x.Longitude <= maxLong)
                    .ToList();
            }
            catch (Exception ex)
            {
                return new EnviReportResult { ErrorMessage = "Ошибка при запросе объектов на карте: " + ex.Message };
                // TODO: Logging
            }
            
			int badFactorsCount = valuableObjectsInArea.Count(x => x.Influence == InfluenceKind.BAD.ToString());
			int goodFactorsCount = valuableObjectsInArea.Count(x => x.Influence == InfluenceKind.GOOD.ToString());
			int neutralFactorsCount = valuableObjectsInArea.Count(x => x.Influence == InfluenceKind.NEUTRAL.ToString());
			
            double execDuration = (DateTime.Now - execStartDate).TotalSeconds;
			return new EnviReportResult {
                GoodFactorsCount = goodFactorsCount,
                BadFactorsCount = badFactorsCount,
                NeutralFactorsCount = neutralFactorsCount,
                FoundValuableObjects = valuableObjectsInArea,
                CreationDurationSec = execDuration,
            };
        }
    }
}
