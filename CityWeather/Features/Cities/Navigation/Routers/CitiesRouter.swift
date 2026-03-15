import Observation

@Observable final class CitiesRouter {
    var cities: [CityRoute] = []

    func pushCity(_ city: City) {
        cities.append(.city(name: city))
    }

    func popCity() {
        guard !cities.isEmpty else { return }
        cities.removeLast()
    }
}
