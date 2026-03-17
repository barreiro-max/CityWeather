struct WeatherMapper {
    static func map(dto: WeatherDTO) -> Weather {
        Weather(dto: dto)
    }
}
