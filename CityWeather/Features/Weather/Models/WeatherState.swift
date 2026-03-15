enum WeatherState {
    case idle
    case success(weather: Weather)
    case failure(error: String)
}

