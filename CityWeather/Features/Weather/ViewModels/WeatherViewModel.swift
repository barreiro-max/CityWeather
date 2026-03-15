import Observation

@MainActor
@Observable final class WeatherViewModel {
    // MARK: - Dependencies
    private let repository: WeatherRepository
    
    // MARK: - UI State
    var state: WeatherState
        
    init(
        repository: WeatherRepository,
        state: WeatherState = .idle
    ) {
        self.repository = repository
        self.state = state
    }
    
    func fetchWeather(for city: City) async {
        do {
            let weather = try await repository.fetchWeather(for: city)
            state = .success(weather: weather)
        } catch {
            state = .failure(error: error.localizedDescription)
        }
    }
}

