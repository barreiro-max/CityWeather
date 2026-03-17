protocol WeatherDataSource {
    func fetchWeather(for cityID: String) async throws -> WeatherDTO
}
