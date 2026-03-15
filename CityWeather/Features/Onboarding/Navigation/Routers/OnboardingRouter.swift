import Observation

@Observable final class OnboardingRouter {
    var path: [WeatherRoute] = []

    func push(_ route: WeatherRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func passOnboarding() {
        path.removeAll()
        path.append(.mainTabBar)
    }
}

