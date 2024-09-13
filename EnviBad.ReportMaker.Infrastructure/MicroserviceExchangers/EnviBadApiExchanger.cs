using EnviBad.ReportMaker.Common.DTO;
using EnviBad.ReportMaker.Common.Models.Options;
using EnviBad.ReportMaker.Infrastructure.Interfaces;
using Microsoft.Extensions.Options;
using System.Text;
using Newtonsoft.Json;

namespace EnviBad.ReportMaker.Infrastructure.MicroserviceExchangers
{
    /// <summary>
    /// Обменник с микросервисом EnviBad.API напрямую
    /// </summary>
    public class EnviBadApiExchanger: IEnviBadApiExchanger
    {
        private readonly EnviBadApiConnectionOptions _apiConnectOptions;
        private readonly HttpClient _httpClient;
        public EnviBadApiExchanger(IOptions<EnviBadApiConnectionOptions> apiConnectOptions,
            IHttpClientFactory httpClientFactory)
        {
            _apiConnectOptions = apiConnectOptions.Value;
            _httpClient = httpClientFactory.CreateClient();
        }

        /// <summary>
        /// Обновление статуса и ID результата (либо задание ошибки) в записи о запрошенном отчете
        /// </summary>
        /// <returns>Описание ошибки или null</returns>
        public async Task<string?> UpdateReportRequestAsync(ReportRequestUpdateDto model)
        {
            string jsonBody = JsonConvert.SerializeObject(model);
            var content = new StringContent(jsonBody, Encoding.UTF8, "application/json");
            string fullUrl = _apiConnectOptions.ServiceUrl + "/report/requested";
            var result = await _httpClient.PatchAsync(fullUrl, content);
            return null;
        }
    }
}
