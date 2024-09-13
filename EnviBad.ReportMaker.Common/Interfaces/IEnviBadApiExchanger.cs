using EnviBad.ReportMaker.Common.DTO;

namespace EnviBad.ReportMaker.Infrastructure.Interfaces
{
    public interface IEnviBadApiExchanger
    {
        Task<string?> UpdateReportRequestAsync(ReportRequestUpdateDto model);
    }
}
