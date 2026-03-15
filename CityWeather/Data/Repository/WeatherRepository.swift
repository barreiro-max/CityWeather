protocol WeatherRepository {
    func fetchWeather(for city: City) async throws -> Weather
}
