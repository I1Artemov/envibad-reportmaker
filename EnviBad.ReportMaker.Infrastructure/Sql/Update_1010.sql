-- App version: 1.0.0.0 --> 1.0.1.0

CREATE TABLE "EnviReportResults" (
	"Id" UUID NOT NULL,
	"CreationDateTime" timestamptz(6),
	"ErrorMessage" TEXT,
	"CreationDurationSec" NUMERIC(19,4),
	"GoodFactorsCount" INT,
	"BadFactorsCount" INT,
	"NeutralFactorsCount" INT,
	"FoundObjectsJson" JSONB,
	CONSTRAINT "PK_EnviReportResults" PRIMARY KEY ("Id") 
);
COMMENT ON TABLE "EnviReportResults" is 'Результаты создания отчетов по областям в JSON-формате';

INSERT INTO "UpdateInfos"("UpdateTime", "UpdateVersion", "AppVersion","Description") 
VALUES ('now', '0.0.0.2', '1.0.1.0', 'Created table EnviReportResults'); 
