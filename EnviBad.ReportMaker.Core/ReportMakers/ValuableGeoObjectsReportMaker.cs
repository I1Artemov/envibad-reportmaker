using EnviBad.ReportMaker.Common;
using EnviBad.ReportMaker.Common.Models;
using EnviBad.ReportMaker.Core.Helpers;
using EnviBad.ReportMaker.Core.Interfaces;
using EnviBad.ReportMaker.Infrastructure.Interfaces;
using EnviBad.Shared.Models.MqMessages;
using Newtonsoft.Json;

namespace EnviBad.ReportMaker.Core.ReportMakers
{
    /// <summary>
    /// Класс для созданиия отчетов по гео-объектам с положительным и отрицательным влиянием на область
    /// </summary>
    public class ValuableGeoObjectsReportMaker : IEnviReportMaker
    {
        private readonly IValuableGeoObjectRepo _geoObjectsRepo;
        private readonly IEnviReportResultRepo _enviReportResultRepo;


        public ValuableGeoObjectsReportMaker(IValuableGeoObjectRepo geoObjectsRepo, IEnviReportResultRepo enviReportResultRepo)
        {
            _geoObjectsRepo = geoObjectsRepo;
            _enviReportResultRepo = enviReportResultRepo;
        }

        /// <inheritdoc />
        public string? SaveReportResultToDb(EnviReportResult reportResult)
        {
            _enviReportResultRepo.Add(reportResult);
            // TODO: Логгирование
            return _enviReportResultRepo.Save(null, $"Saving EnviReportResult with id {reportResult.Id}");
        }

        /// <inheritdoc />
        public EnviReportResult GetReport(ReportRequestCreated reportParams)
        {
            DateTime execStartDate = DateTime.Now;
            if (reportParams.CenterLat == null || reportParams.CenterLong == null || reportParams.AreaRadius == null)
                return new EnviReportResult {ErrorMessage = "Не заданы координаты или радиус области"};
            // TODO: Переделать на поиск в радиусе
            double minLat = GeoUtils.AddMetersToLat(reportParams.CenterLat.Value, -reportParams.AreaRadius.Value);
            double maxLat = GeoUtils.AddMetersToLat(reportParams.CenterLat.Value, reportParams.AreaRadius.Value);
            double minLong = GeoUtils.AddMetersToLong(
                reportParams.CenterLong.Value, - reportParams.AreaRadius.Value, reportParams.CenterLat.Value);
            double maxLong = GeoUtils.AddMetersToLong(
                reportParams.CenterLong.Value, reportParams.AreaRadius.Value, reportParams.CenterLat.Value);
            List<ValuableGeoObject> valuableObjectsInArea = new List<ValuableGeoObject>();
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
                FoundObjectsJson = JsonConvert.SerializeObject(valuableObjectsInArea)
            };
        }
    }
}
