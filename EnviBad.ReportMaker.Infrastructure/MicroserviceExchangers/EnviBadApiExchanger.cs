using EnviBad.ReportMaker.Common.Models.Options;
using EnviBad.ReportMaker.Infrastructure.Interfaces;
using Microsoft.Extensions.Options;

namespace EnviBad.ReportMaker.Infrastructure.MicroserviceExchangers
{
    /// <summary>
    /// Обменник с микросервисом EnviBad.API напрямую
    /// </summary>
    public class EnviBadApiExchanger: IEnviBadApiExchanger
    {
        private readonly EnviBadApiConnectionOptions _apiConnectOptions;
        public EnviBadApiExchanger(IOptions<EnviBadApiConnectionOptions> apiConnectOptions)
        {
            _apiConnectOptions = apiConnectOptions.Value;
        }

        /// <summary>
        /// Обновление статуса и ID результата (либо задание ошибки) в записи о запрошенном отчете
        /// </summary>
        /// <returns>Описание ошибки или null</returns>
        public async Task<string?> UpdateReportRequestAsync()
        {
            return null;
        }
    }
}
