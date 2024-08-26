# EnviBad - ReportMaker Microservice

Микросервис, отвечающий за создание отчетов по окружению для EnviBad.

Получает задания на формирование отчетов из очереди сообщений RabbitMQ, кладет результаты в собственную БД.

## Структура решения

1. EnviBad.ReportMaker.Worker. Консольное приложение, воркер. Слушает сообщения из очереди и при их получении начинает формировать отчеты.
2. EnviBad.ReportMaker.Infrastructure. Библиотека классов, все, связанное с хранением данных.
3. EnviBad.ReportMaker.Core. Библиотека классов, все, касающееся логики создания отчетов.
4. EnviBad.ReportMaker.Tests. Проект с тестами xUnit.

## Технологии

Во всех проектах - .Net 8, СУБД PostgreSQL, ORM EntityFramework 8.0.8, тесты на xUnit.

## Виды отчетов

TODO: (Coming soon)