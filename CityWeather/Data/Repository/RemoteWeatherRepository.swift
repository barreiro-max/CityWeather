struct RemoteWeatherRepository: WeatherRepository {
    private let dataSource: WeatherDataSource
    
    init(dataSource: WeatherDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchWeather(for city: City) async throws -> Weather {
        do {
            let dto = try await dataSource.fetchWeather(for: city.id)
            let weather = WeatherMapper.map(dto: dto)
            Logger.data.log("Weather data mapped successfully")
            return weather
        } catch  {
            Logger.data.error("Weather data is missing: \(error.localizedDescription)")
            throw WeatherRepositoryError.missingWeatherData
        }
    }
}
