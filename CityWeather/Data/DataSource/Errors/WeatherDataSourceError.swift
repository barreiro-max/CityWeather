import Foundation
enum WeatherDataSourceError: LocalizedError {
    case badURL
    case badServerResponse
    case corruptedResponse
    
    var errorDescription: String? {
        switch self {
            case .badURL:
            return "URL is invalid"
        case .badServerResponse:
            return "Server returned bad response"
        case .corruptedResponse:
            return "Response data corrupted"
        }
    }
}
