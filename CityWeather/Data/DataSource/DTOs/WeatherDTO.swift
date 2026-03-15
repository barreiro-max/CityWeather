struct WeatherDTO: Decodable {
    let temperature: Double
    let feelsLike: Double
    let humidity: Int
    let windSpeed: Double
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case wind
        case weather
    }

    enum MainKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case humidity
    }

    enum WindKeys: String, CodingKey {
        case speed
    }

    enum WeatherKeys: String, CodingKey {
        case description
        case icon
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let main = try container.nestedContainer(keyedBy: MainKeys.self, forKey: .main)
        temperature = try main.decode(Double.self, forKey: .temp)
        feelsLike = try main.decode(Double.self, forKey: .feelsLike)
        humidity = try main.decode(Int.self, forKey: .humidity)
        
        let wind = try container.nestedContainer(keyedBy: WindKeys.self, forKey: .wind)
        windSpeed = try wind.decode(Double.self, forKey: .speed)
        
        var weatherArray = try container.nestedUnkeyedContainer(forKey: .weather)
        let weather = try weatherArray.nestedContainer(keyedBy: WeatherKeys.self)
        description = try weather.decode(String.self, forKey: .description)
        icon = try weather.decode(String.self, forKey: .icon)
    }
}


