namespace EnviBad.ReportMaker.Core.Helpers
{
    public static class GeoUtils
    {
        /// <summary>
        /// Добавляет к гео-широте расстояние в метрах
        /// </summary>
        /// <param name="lat">Широта</param>
        /// <param name="meters">Расстояние в метрах</param>
        /// <returns>Модифицированная широта</returns>
        public static double AddMetersToLat(double lat, double meters)
        {
            var earth = 6378.137;  // Радиус Земли в километрах
            var pi = Math.PI;
            var m = (1 / ((2 * pi / 360) * earth)) / 1000;  // 1 метр в градусах

            return lat + (meters * m);
        }

        /// <summary>
        /// Добавляет к гео-долготе расстояние в метрах
        /// </summary>
        /// <param name="lat">Долгота</param>
        /// <param name="meters">Расстояние в метрах</param>
        /// <returns>Модифицированная долгота</returns>
        public static double AddMetersToLong(double longitude, double meters, double currentLat)
        {
            var earth = 6378.137;  // Радиус Земли в километрах
            var pi = Math.PI;
            var m = (1 / ((2 * pi / 360) * earth)) / 1000;  // 1 метр в градусах

            return longitude + (meters * m) / Math.Cos(currentLat * (pi / 180));
        }
    }
}
