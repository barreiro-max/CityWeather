struct RemoteWeatherRepository: WeatherRepository {
    private let dataSource: WeatherDataSource
    
    init(dataSource: WeatherDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchWeather(for city: City) async throws -> Weather {
        do {
            let dto = try await dataSource.fetchWeather(for: city)
            let weather = Weather(dto: dto)
            return weather
        } catch  {
            throw WeatherRepositoryError.missingWeatherData
        }
    }
}
