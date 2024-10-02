namespace EnviBad.ReportMaker.Common
{
    public class Const
    {
        public const string AppVersion = "1.0.1.0";
    }

    public enum ReportStatus
    {
        Created = 0,
        InProgress = 1,
        Completed = 2,
        Failed = 3
    }

    public enum InfluenceKind
    {
        GOOD = 0,
        BAD = 1,
        NEUTRAL = 2
    }
}
