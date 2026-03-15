import Observation

@Observable final class SavedCitiesRouter {
    var savedCities: [CityRoute] = []

    func pushSavedCity(_ city: City) {
        savedCities.append(.city(name: city))
    }

    func popSavedCity() {
        guard !savedCities.isEmpty else { return }
        savedCities.removeLast()
    }
}

