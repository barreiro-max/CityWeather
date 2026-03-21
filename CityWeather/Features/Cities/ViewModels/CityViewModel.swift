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
        if let index = savedCities.firstIndex(where: { $0.id == city.id }) {
            savedCities.remove(at: index)
        }
    }
}
