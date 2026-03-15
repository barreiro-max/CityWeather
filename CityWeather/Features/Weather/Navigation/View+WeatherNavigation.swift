import SwiftUI

extension View {
    @ViewBuilder
    func weatherNavigation() -> some View {
        self.navigationDestination(for: WeatherRoute.self) { route in
            switch route {
            case .finishOnboarding:
                FinishOnboardingView()
            case .mainTabBar:
                WeatherTabBar()
            }
        }
    }
}
