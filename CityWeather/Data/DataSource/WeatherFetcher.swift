import Foundation

struct WeatherFetcher: WeatherDataSource {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchWeather(for cityID: String) async throws -> WeatherDTO {
        let APIKey = Secrets.weatherAPIKey
        
        let URLString = "https://api.openweathermap.org/data/2.5/weather?q=\( cityID),%20Україна&appid=\(APIKey)&units=metric&lang=ua"
        
        
        guard let URL = URL(string: URLString) else {
            throw WeatherDataSourceError.badURL
        }
        
        let (data, URLresponse) = try await session.data(from: URL)

        guard let httpResponse = URLresponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw WeatherDataSourceError.badServerResponse
        }
        
        do {
            let weatherDTO = try JSONDecoder().decode(WeatherDTO.self, from: data)
            return weatherDTO
        } catch {
            throw WeatherDataSourceError.corruptedResponse
        }
    }
}




