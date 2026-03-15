import SwiftUI

struct CityDetailView: View {
    @Environment(CityViewModel.self) var cityViewModel
    @Environment(WeatherViewModel.self) var weatherViewModel
    @State private var showShareSheet = false
    let city: City
    
    var body: some View {
        ZStack {
            cityDetailBackground
            ScrollView {
                VStack(spacing: 24) {
                    cityNameTitle
                    CityDetailStateView(showShareSheet: $showShareSheet, city: city)
                }
            }
            .cityDetailToolbar(
                city: city,
                onSave: cityViewModel.save(city:),
                onDelete: cityViewModel.delete(city:),
                onShare: { showShareSheet = true })
        }
        .task {
            await weatherViewModel.fetchWeather(for: city)
        }
    }

    private var cityNameTitle: some View {
        Text(city.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top, 20)
    }
    
    private var cityDetailBackground: some View {
        LinearGradient(
            colors: [.blue.opacity(0.4), .mint.opacity(0.25)],
            startPoint: .top, endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    CityDetailView(city: City.odesa)
        .environment(
            WeatherViewModel(
                repository: RemoteWeatherRepository(
                    dataSource: WeatherFetcher()
                )
            )
        )
        .environment(
            CityViewModel(savedCities: [.chernivtsi, .ivanoFrankivsk, .lviv])
        )
}
