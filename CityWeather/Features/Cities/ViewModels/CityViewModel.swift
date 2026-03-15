import Observation

@MainActor
@Observable final class CityViewModel {
    var savedCities: [City]
    
    init(savedCities: [City] = []) {
        self.savedCities = savedCities
    }
    
    func save(city: City) {
        if !savedCities.contains(city) {
            savedCities.append(city)
        }
    }
    
    func delete(city: City) {
        guard !savedCities.isEmpty else { return }
        savedCities.removeLast()
    }
}
