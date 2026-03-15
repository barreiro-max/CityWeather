import Foundation
enum WeatherRepositoryError: LocalizedError {
    case missingWeatherData
    
    var errorDescription: String? {
        switch self {
        case .missingWeatherData:
            return "Missing weather data"
        }
    }
}
