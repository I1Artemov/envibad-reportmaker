
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS base
USER app
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["EnviBad.ReportMaker.Worker/EnviBad.ReportMaker.Worker.csproj", "EnviBad.ReportMaker.Worker/"]
COPY ["EnviBad.ReportMaker.Common/EnviBad.ReportMaker.Common.csproj", "EnviBad.ReportMaker.Common/"]
COPY ["EnviBad.ReportMaker.Core/EnviBad.ReportMaker.Core.csproj", "EnviBad.ReportMaker.Core/"]
COPY ["EnviBad.ReportMaker.Infrastructure/EnviBad.ReportMaker.Infrastructure.csproj", "EnviBad.ReportMaker.Infrastructure/"]
RUN dotnet restore "./EnviBad.ReportMaker.Worker/EnviBad.ReportMaker.Worker.csproj"
COPY . .
WORKDIR "/src/EnviBad.ReportMaker.Worker"
RUN dotnet build "./EnviBad.ReportMaker.Worker.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./EnviBad.ReportMaker.Worker.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "EnviBad.ReportMaker.Worker.dll"]