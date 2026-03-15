struct Weather {
    let temperature: Double
    let feelsLike: Double
    let humidity: Int
    let windSpeed: Double
    let description: String
    let icon: String
    
    init(dto: WeatherDTO) {
        self.temperature = dto.temperature
        self.feelsLike = dto.feelsLike
        self.humidity = dto.humidity
        self.windSpeed = dto.windSpeed
        self.description = dto.description
        self.icon = dto.icon
    }
}
