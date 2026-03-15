import SwiftUI

struct WeatherTabBar: View {
    @State private var tabViewModel = WeatherTabViewModel(screen: .allCities)
    @State var weatherRouter = WeatherRouter()
    @State var citiesRouter = CitiesRouter()
    @State var citiesViewModel = CityViewModel()
    @State var savedCitiesRouter = SavedCitiesRouter()
    
    var body: some View {
        TabView(selection: $tabViewModel.screen) {
            Tab("Міста", systemImage: "building.2", value: .allCities) {
                AllCitiesView()
                    .environment(citiesViewModel)
                    .environment(citiesRouter)
            }
            Tab("Обране",  systemImage: "star.fill", value: .savedCities) {
                SavedCitiesView()
                    .environment(savedCitiesRouter)
                    .environment(weatherRouter)
                    .environment(citiesViewModel)
            }
        }
    }
}

#Preview {
    WeatherTabBar()
}
