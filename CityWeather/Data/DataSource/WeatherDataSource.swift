protocol WeatherDataSource {
    func fetchWeather(for city: City) async throws -> WeatherDTO
}
