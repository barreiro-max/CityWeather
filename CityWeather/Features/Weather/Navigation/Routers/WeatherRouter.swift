import Observation

@Observable final class WeatherRouter {
    var path: [WeatherRoute] = []

    func push(_ route: WeatherRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
