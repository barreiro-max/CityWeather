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
    
    func moveCities(from source: IndexSet, to destination: Int) {
        guard !source.isEmpty,
              destination >= 0,
              destination <= savedCities.count else {
            return
        }
        
        savedCities.move(fromOffsets: source, toOffset: destination)
    }
}
