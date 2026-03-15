import SwiftUI

struct AllCitiesView: View {
    @Environment(CitiesRouter.self) var router
    @Environment(CityViewModel.self) var viewModel
    @State var searchableCity: String = ""
    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.cities) {
            if filteredCities.isEmpty {
                emptyCitiesList
            }
            allCitiesList
                .cityNavigation()
                .navigationTitle("Міста України")
                .searchable(
                    text: $searchableCity,
                    prompt: "Пошук міста за назвою")
            infoLabel
        }
    }
    
    private var emptyCitiesList: some View {
        ContentUnavailableView(
            "Місто не знайдено",
            systemImage: "magnifyingglass"
        )
    }
    
    private var allCitiesList: some View {
        List(filteredCities, id: \.name) { city in
            CityRow(city: city)
                .cityContextMenu(
                    city: city,
                    save: viewModel.save(city:),
                    delete: viewModel.delete(city:))
        }
    }
    
    private var infoLabel: some View {
        Text("Натисніть на назву міста, щоб побачити деталі")
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    
    // MARK: - Search Cities Logic
    private var filteredCities: [City] {
        if searchableCity.isEmpty {
            City.allCases
        } else {
            City.allCases.filter {
                $0.name.localizedCaseInsensitiveContains(searchableCity)
            }
        }
    }
}

#Preview {
    AllCitiesView()
        .environment(CitiesRouter())
        .environment(
            CityViewModel(savedCities: [.chernivtsi, .ivanoFrankivsk, .lviv])
        )
}
