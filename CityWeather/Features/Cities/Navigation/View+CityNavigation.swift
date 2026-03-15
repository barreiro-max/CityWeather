import SwiftUI

extension View {
    @ViewBuilder
    func cityNavigation() -> some View {
        self.navigationDestination(for: CityRoute.self) { route in
            switch route {
            case .city(let city):
                CityDetailView(city: city)
            }
        }
    }
}
