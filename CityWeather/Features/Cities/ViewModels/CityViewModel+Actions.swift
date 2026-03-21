//
//  CityViewModel+Delete.swift
//  CityWeather
//
//  Created by MaxAdmin on 21.03.2026.
//

import Foundation

extension CityViewModel {
    
    func delete(at offsets: IndexSet) {
        savedCities.remove(atOffsets: offsets)
    }
}
