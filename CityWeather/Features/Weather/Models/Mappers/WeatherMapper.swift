struct WeatherMapper {
    static func map(dto: WeatherDTO) -> Weather {
        Weather(
            temperature: dto.temperature,
            feelsLike: dto.feelsLike,
            humidity: dto.humidity,
            windSpeed: dto.windSpeed,
            description: dto.description,
            icon: dto.icon
        )
    }
}
