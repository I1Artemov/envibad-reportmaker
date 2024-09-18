-- App version: 1.0.0.0

--Создание юзера-владельца базы данных
--CREATE USER envibad_report_user WITH password 'dasfbuC7435Mzd3';
--CREATE DATABASE envibad_report OWNER envibad_report_user;

--Делать из-под постгреса, встав на созданную БД envibad_report
--CREATE SCHEMA envibad_report_user AUTHORIZATION envibad_report_user;

--Запросы на создание таблиц выполнять от envibad_report_user

CREATE TABLE "LogEntries" (
  "Id" serial,
  "CreationDateTime" timestamptz(6),
  "Level" text,
  "Message" text,
  "Url" text,
  "UserName" text,
  "MachineName" text,
  "Exception" text,
  "UserIp" text,
  CONSTRAINT "PK_LogEntries" PRIMARY KEY ("Id") 
);
COMMENT ON TABLE "LogEntries" is 'Логи приложения';

CREATE TABLE "UpdateInfos" (
	"Id" serial,
	"UpdateTime" timestamp,
	"UpdateVersion" text,
	"AppVersion" text,
	"Description" text,
	CONSTRAINT "PK_UpdateInfos" PRIMARY KEY ("Id") 
);
COMMENT ON TABLE "UpdateInfos" is 'Таблица лога измений SQL';

CREATE TABLE "ValuableGeoObjects" (
	"Id" serial,
	"CreationDate" timestamp,
	"Latitude" numeric(19,4),
	"Longitude" numeric(19,4),
	"Address" TEXT,
	"Name" varchar(256),
	"ObjectKind" varchar(128),
	"Influence" varchar(64),
	CONSTRAINT "PK_ValuableGeoObjects" PRIMARY KEY ("Id") 
);
COMMENT ON TABLE "ValuableGeoObjects" is 'Важные гео-объекты для создания отчетов';

INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.954969,  60.446875, 'Свердловская область, городской округ Среднеуральск, посёлок Кирпичный, улица Южная Застава', 'Очистные в кирпичном', 'Очистные сооружения', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.981835,  60.362273, 'Свердловская область, поселок Исеть', 'Очистные в Исети', 'Очистные сооружения', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.987420,  60.483874, 'Свердловская область, Среднеуральск, СНТ № 2 СУЗМК, 12,', 'Очистные в Среднеуральске', 'Очистные сооружения', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.944140,  60.605344, 'Успенский проспект, 1/2, Верхняя Пышма, Свердловская область', 'Очистные у Верхней Пышмы', 'Очистные сооружения', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.915848,  60.640427, 'Совхозная улица, 26, Екатеринбург, Свердловская область', 'Очистные на Калиновке', 'Очистные сооружения', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.902531,  60.602408, 'улица Индустрии, 55, Екатеринбург, Свердловская область, 620042', 'Общежитие № 2 Российского государственного профессионально-педагогического университета', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.898895,  60.639461, 'Таганская улица, 22, Екатеринбург, Свердловская область, 620057', 'Общежитие Уральского юридического института МВД', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.896198,  60.621366, 'улица Кобозева, 31, Екатеринбург, Свердловская область, 620135', 'Общежитие Уральского Турбинного Завода № 5', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.894827,  60.615610, 'улица Войкова, 2, Екатеринбург, Свердловская область, 620017', 'Общежитие Екатеринбургского экономико-технологического колледжа', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.890815,  60.570609, 'Донбасская улица, 8, жилой район Уралмаш, Екатеринбург, Свердловская область', 'Общежитие на Донбасской', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.891293,  60.601699, 'улица Ильича, 26, Екатеринбург, Свердловская область, 620012', 'Общежитие ФГАОУ ВО Российский государственный профессионально-педагогический университет, общежитие № 5', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.890582,  60.632717, 'улица Краснофлотцев, 21, Екатеринбург, Свердловская область, 620017', 'Общежитие УЭТМ', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.881589,  60.614279, 'проспект Космонавтов, 30к1, Екатеринбург, Свердловская область, 620017', 'Общежитие № 1 Уральского государственного педагогического университета', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.868741,  60.613400, 'проспект Космонавтов, 14А, подъезд 1, Екатеринбург, Свердловская область', 'Общежитие Уральского техникума автомобильного транспорта и сервиса', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.868659,  60.654180, 'улица Данилы Зверева, 30/1, Екатеринбург, Свердловская область, 620066', 'Общежитие Сунц УрФУ', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.861360,  60.615965, 'улица Маяковского, 2Б, подъезд 1, Екатеринбург, Свердловская область', 'Общежитие Свердловского учебного центра профессиональных квалификаций', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.857570,  60.582655, 'Выездной переулок, 8, Екатеринбург, Свердловская область, 620107', 'Общежитие № 7', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.859673,  60.643930, 'Июльская улица, 18, Екатеринбург, Свердловская область, 620137', 'Общежитие № 3 УрГЮУ', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.853931,  60.579344, 'улица Машинистов, 4А, Екатеринбург, Свердловская область, 620107', 'Общежитие № 6', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.851215,  60.600200, 'улица Братьев Быковых, 32, Екатеринбург, Свердловская область', 'УрГУПС, общежитие № 3', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.850818,  60.576585, 'улица Колмогорова, 68, Екатеринбург, Свердловская область, 620034', 'Общежитие № 4, УрГУПС', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.850449,  60.607706, 'улица Лермонтова, 4, Екатеринбург, Свердловская область', 'Кжт УрГУПС, общежитие № 2', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.850625,  60.657962, 'Комсомольская улица, 21А, Екатеринбург, Свердловская область', 'Общежитие № 2 УрГЮУ', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.836035,  60.568571, 'улица Мельникова, 19, Екатеринбург, Свердловская область, 620028', 'Уральский государственный педагогический университет, Общежитие № 4', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.839659,  60.627954, 'проспект Ленина, 54к6, подъезд 1, Екатеринбург, Свердловская область', 'Горный уральский государственный университет', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.839693,  60.649450, 'улица Малышева, 130, Екатеринбург, Свердловская область, 620078', 'Уксап, Общежитие № 1', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.840247,  60.659161, 'Комсомольская улица, 66, Екатеринбург, Свердловская область, 620078', 'Общежитие № 5 УрФУ', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.837664,  60.657329, 'улица Фонвизина, 4, Екатеринбург, Свердловская область', 'Общежитие УрФУ № 12', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.825342,  60.618826, 'улица Белинского, 71В, Екатеринбург, Свердловская область, 620026', 'Общежитие Угк имени И. И. Ползунова', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.827737,  60.601633, 'улица 8 Марта, 50, Екатеринбург, Свердловская область, 620014', 'Екатеринбургского государственного театрального института, общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.825050,  60.635498, 'улица Мичурина, 201, Екатеринбург, Свердловская область, 620100', 'Торгово-экономический техникум г. Екатеринбург, общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.823330,  60.657521, 'Сибирский тракт, 31Г, Екатеринбург, Свердловская область', 'Уральский государственный лесотехнический университет, общежитие № 5', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.821876,  60.604378, 'улица 8 Марта, 70, Екатеринбург, Свердловская область, 620144', 'Общежитие Уиу РАНХиГС', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.819054,  60.604633, 'улица 8 Марта, 82Б, Екатеринбург, Свердловская область, 620144', 'Общежитие Уггу', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.817810,  60.586175, 'Посадская улица, 79, Екатеринбург, Свердловская область, 620102', 'Свердловский колледж искусства и культуры, общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.815366,  60.587971, 'Ясная улица, 1к1, Екатеринбург, Свердловская область, 620102', 'Екатеринбургский филиал Фау РосКапСтрой, общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.817882,  60.612732, 'улица Большакова, 71, Екатеринбург, Свердловская область, 620144', 'УрФУ, общежитие № 4', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.809753,  60.626483, 'улица Щорса, 17, Екатеринбург, Свердловская область, 620142', 'Общежитие Внии Труда Минтруда России', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.809478,  60.606707, 'улица Щорса, 94А, Екатеринбург, Свердловская область, 620144', 'Уральская государственная консерватория имени М. П. Мусорского, общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.799605,  60.627386, 'улица Белинского, 226к3, подъезд 1, Екатеринбург, Свердловская область', 'Уральский Государственный Аграрный университет, общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.781608,  60.607166, 'Военная улица, 5, Екатеринбург, Свердловская область, 620085', 'ГБОУ СПО Со Екатеринбургский химико-механический политехникум Общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.777207,  60.612213, 'улица Титова, 25, Екатеринбург, Свердловская область, 620085', 'Общежитие Мясокомбината Екатеринбургский', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.806958,  60.556998, 'улица Академика Бардина, 14, подъезд 1, Екатеринбург, Свердловская область', 'Общежитие для медработников ГБУЗ Со Сокб № 1', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.831709,  60.551828, 'Заводская улица, 38, подъезд 1, Екатеринбург, Свердловская область', 'Уральский радиотехнический колледж им. А. С. Попова, общежитие', 'Общежитие', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.902344,  60.612854, 'проспект Космонавтов, 45, Екатеринбург, Свердловская область, 620098', 'Метро Проспект Космонавтов', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.887664,  60.612449, 'улица Кузнецова, 2А/2, Екатеринбург, Свердловская область', 'Метро Уралмаш', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.878493,  60.612114, 'площадь Первой Пятилетки, лит96, Екатеринбург, Свердловская область', 'Метро Машиностроителей', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.857933,  60.600107, 'Вокзальная улица, 15Б, Екатеринбург, Свердловская область, 620107', 'Метро Уральская', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.847803,  60.599310, 'улица Николая Никонова, 18, Екатеринбург, Свердловская область, 620027', 'Метро Динамо', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.836116,  60.598786, 'Театральный переулок, 2А, Екатеринбург, Свердловская область, 620014', 'Метро площадь 1905', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.827222,  60.601562, 'улица Куйбышева, 57, Екатеринбург, Свердловская область, 620144', 'Метро Геологическая', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.808768,  60.609503, 'улица Щорса, 92, Екатеринбург, Свердловская область, 620144', 'Метро Чкаловская', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.797960,  60.632131, 'улица Белинского, 232, Екатеринбург, Свердловская область, 620130', 'Метро Ботаническая', 'Метро', 'GOOD', '2024-09-18 00:00:00.000000');

INSERT INTO "UpdateInfos"("UpdateTime", "UpdateVersion", "AppVersion","Description") 
VALUES ('now', '0.0.0.1', '1.0.0.0', 'Created table ValuableGeoObjects'); 
