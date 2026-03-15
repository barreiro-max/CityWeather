import SwiftUI

struct CityDetailStateView: View {
    @Environment(WeatherViewModel.self) var viewModel
    @Binding var showShareSheet: Bool
    let city: City
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            ProgressView("Дані завантажуються...")
                .foregroundStyle(.secondary)
            
        case .success(let weather):
            makeWeatherView(with: weather)
                .padding()
                .background(.blue.opacity(0.2))
                .cornerRadius(16)
                .sheet(isPresented: $showShareSheet) {
                    ShareWeatherView(city: city, weather: weather)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            
        case .failure(let error):
            ErrorView(message: error)
        }
    }
}

extension CityDetailStateView {
    private func makeWeatherView(with weather: Weather) -> some View {
        VStack(spacing: 16) {
            HStack(alignment: .center, spacing: 16) {
                descriptionLabel(with: weather)
            }
            HStack(spacing: 24) {
                temperatureLabel(with: weather.temperature)
                feelsLikeLabel(with: weather.feelsLike)
            }
            HStack(spacing: 24) {
                humidityLabel(with: weather.humidity)
                windSpeedLabel(with: weather.windSpeed)
            }
        }
    }
}
