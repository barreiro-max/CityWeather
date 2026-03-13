//
//  SecretsDecoder.swift
//  CityWeather
//
//  Created by MaxAdmin on 13.03.2026.
//

import Foundation

enum Secrets {
    static var weatherAPIKey: String {
        guard let key = Bundle.main.infoDictionary?["WEATHER_API_KEY"] as? String
        else { fatalError("Weather API key is not found!") }
        return key
    }
}
