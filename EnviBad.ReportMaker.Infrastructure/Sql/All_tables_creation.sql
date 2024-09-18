-- App version: 1.0.0.0

--�������� �����-��������� ���� ������
--CREATE USER envibad_report_user WITH password 'dasfbuC7435Mzd3';
--CREATE DATABASE envibad_report OWNER envibad_report_user;

--������ ��-��� ���������, ����� �� ��������� �� envibad_report
--CREATE SCHEMA envibad_report_user AUTHORIZATION envibad_report_user;

--������� �� �������� ������ ��������� �� envibad_report_user

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
COMMENT ON TABLE "LogEntries" is '���� ����������';

CREATE TABLE "UpdateInfos" (
	"Id" serial,
	"UpdateTime" timestamp,
	"UpdateVersion" text,
	"AppVersion" text,
	"Description" text,
	CONSTRAINT "PK_UpdateInfos" PRIMARY KEY ("Id") 
);
COMMENT ON TABLE "UpdateInfos" is '������� ���� ������� SQL';

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
COMMENT ON TABLE "ValuableGeoObjects" is '������ ���-������� ��� �������� �������';

INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.954969,  60.446875, '������������ �������, ��������� ����� �������������, ������ ���������, ����� ����� �������', '�������� � ���������', '�������� ����������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.981835,  60.362273, '������������ �������, ������� �����', '�������� � �����', '�������� ����������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.987420,  60.483874, '������������ �������, �������������, ��� � 2 �����, 12,', '�������� � ��������������', '�������� ����������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.944140,  60.605344, '��������� ��������, 1/2, ������� �����, ������������ �������', '�������� � ������� �����', '�������� ����������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.915848,  60.640427, '��������� �����, 26, ������������, ������������ �������', '�������� �� ���������', '�������� ����������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.902531,  60.602408, '����� ���������, 55, ������������, ������������ �������, 620042', '��������� � 2 ����������� ���������������� ���������������-��������������� ������������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.898895,  60.639461, '��������� �����, 22, ������������, ������������ �������, 620057', '��������� ���������� ������������ ��������� ���', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.896198,  60.621366, '����� ��������, 31, ������������, ������������ �������, 620135', '��������� ���������� ���������� ������ � 5', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.894827,  60.615610, '����� �������, 2, ������������, ������������ �������, 620017', '��������� ����������������� ���������-���������������� ��������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.890815,  60.570609, '���������� �����, 8, ����� ����� �������, ������������, ������������ �������', '��������� �� ����������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.891293,  60.601699, '����� ������, 26, ������������, ������������ �������, 620012', '��������� ����� �� ���������� ��������������� ���������������-�������������� �����������, ��������� � 5', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.890582,  60.632717, '����� �������������, 21, ������������, ������������ �������, 620017', '��������� ����', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.881589,  60.614279, '�������� �����������, 30�1, ������������, ������������ �������, 620017', '��������� � 1 ���������� ���������������� ��������������� ������������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.868741,  60.613400, '�������� �����������, 14�, ������� 1, ������������, ������������ �������', '��������� ���������� ��������� �������������� ���������� � �������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.868659,  60.654180, '����� ������ �������, 30/1, ������������, ������������ �������, 620066', '��������� ���� ����', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.861360,  60.615965, '����� �����������, 2�, ������� 1, ������������, ������������ �������', '��������� ������������� �������� ������ ���������������� ������������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.857570,  60.582655, '�������� ��������, 8, ������������, ������������ �������, 620107', '��������� � 7', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.859673,  60.643930, '�������� �����, 18, ������������, ������������ �������, 620137', '��������� � 3 �����', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.853931,  60.579344, '����� ����������, 4�, ������������, ������������ �������, 620107', '��������� � 6', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.851215,  60.600200, '����� ������� �������, 32, ������������, ������������ �������', '������, ��������� � 3', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.850818,  60.576585, '����� �����������, 68, ������������, ������������ �������, 620034', '��������� � 4, ������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.850449,  60.607706, '����� ����������, 4, ������������, ������������ �������', '��� ������, ��������� � 2', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.850625,  60.657962, '������������� �����, 21�, ������������, ������������ �������', '��������� � 2 �����', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.836035,  60.568571, '����� ����������, 19, ������������, ������������ �������, 620028', '��������� ��������������� �������������� �����������, ��������� � 4', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.839659,  60.627954, '�������� ������, 54�6, ������� 1, ������������, ������������ �������', '������ ��������� ��������������� �����������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.839693,  60.649450, '����� ��������, 130, ������������, ������������ �������, 620078', '�����, ��������� � 1', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.840247,  60.659161, '������������� �����, 66, ������������, ������������ �������, 620078', '��������� � 5 ����', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.837664,  60.657329, '����� ���������, 4, ������������, ������������ �������', '��������� ���� � 12', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.825342,  60.618826, '����� ����������, 71�, ������������, ������������ �������, 620026', '��������� ��� ����� �. �. ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.827737,  60.601633, '����� 8 �����, 50, ������������, ������������ �������, 620014', '����������������� ���������������� ������������ ���������, ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.825050,  60.635498, '����� ��������, 201, ������������, ������������ �������, 620100', '�������-������������� �������� �. ������������, ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.823330,  60.657521, '��������� �����, 31�, ������������, ������������ �������', '��������� ��������������� ��������������� �����������, ��������� � 5', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.821876,  60.604378, '����� 8 �����, 70, ������������, ������������ �������, 620144', '��������� ��� �������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.819054,  60.604633, '����� 8 �����, 82�, ������������, ������������ �������, 620144', '��������� ����', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.817810,  60.586175, '��������� �����, 79, ������������, ������������ �������, 620102', '������������ ������� ��������� � ��������, ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.815366,  60.587971, '����� �����, 1�1, ������������, ������������ �������, 620102', '���������������� ������ ��� �����������, ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.817882,  60.612732, '����� ����������, 71, ������������, ������������ �������, 620144', '����, ��������� � 4', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.809753,  60.626483, '����� �����, 17, ������������, ������������ �������, 620142', '��������� ���� ����� �������� ������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.809478,  60.606707, '����� �����, 94�, ������������, ������������ �������, 620144', '��������� ��������������� ������������� ����� �. �. ����������, ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.799605,  60.627386, '����� ����������, 226�3, ������� 1, ������������, ������������ �������', '��������� ��������������� �������� �����������, ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.781608,  60.607166, '������� �����, 5, ������������, ������������ �������, 620085', '���� ��� �� ���������������� ������-������������ ������������ ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.777207,  60.612213, '����� ������, 25, ������������, ������������ �������, 620085', '��������� ������������� ����������������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.806958,  60.556998, '����� ��������� �������, 14, ������� 1, ������������, ������������ �������', '��������� ��� ������������� ���� �� ���� � 1', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.831709,  60.551828, '��������� �����, 38, ������� 1, ������������, ������������ �������', '��������� ���������������� ������� ��. �. �. ������, ���������', '���������', 'BAD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.902344,  60.612854, '�������� �����������, 45, ������������, ������������ �������, 620098', '����� �������� �����������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.887664,  60.612449, '����� ���������, 2�/2, ������������, ������������ �������', '����� �������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.878493,  60.612114, '������� ������ ���������, ���96, ������������, ������������ �������', '����� ����������������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.857933,  60.600107, '���������� �����, 15�, ������������, ������������ �������, 620107', '����� ���������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.847803,  60.599310, '����� ������� ��������, 18, ������������, ������������ �������, 620027', '����� ������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.836116,  60.598786, '����������� ��������, 2�, ������������, ������������ �������, 620014', '����� ������� 1905', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.827222,  60.601562, '����� ���������, 57, ������������, ������������ �������, 620144', '����� �������������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.808768,  60.609503, '����� �����, 92, ������������, ������������ �������, 620144', '����� ����������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');
INSERT INTO "ValuableGeoObjects" ("Latitude", "Longitude", "Address", "Name", "ObjectKind", "Influence", "CreationDate") VALUES (56.797960,  60.632131, '����� ����������, 232, ������������, ������������ �������, 620130', '����� ������������', '�����', 'GOOD', '2024-09-18 00:00:00.000000');

INSERT INTO "UpdateInfos"("UpdateTime", "UpdateVersion", "AppVersion","Description") 
VALUES ('now', '0.0.0.1', '1.0.0.0', 'Created table ValuableGeoObjects'); 
