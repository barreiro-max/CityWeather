import Observation

@MainActor
@Observable final class WeatherTabViewModel {
    var screen: WeatherScreen
    
    init(screen: WeatherScreen) {
        self.screen = screen
    }
}
