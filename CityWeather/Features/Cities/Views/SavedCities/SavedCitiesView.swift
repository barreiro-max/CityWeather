import SwiftUI

struct SavedCitiesView: View {
    @Environment(SavedCitiesRouter.self) var router
    @Environment(CityViewModel.self) var viewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.savedCities) {
            if viewModel.savedCities.isEmpty {
                emptySavedCitiesList
                
            } else {
                savedCitiesList
                    .cityNavigation()
                    .navigationTitle("Обрані міста")
            }
        }
    }
    
    private var emptySavedCitiesList: some View {
        ContentUnavailableView(
            "Збережених міст не знайдено",
            systemImage: "magnifyingglass"
        )
    }
    
    private var savedCitiesList: some View {
        List {
            ForEach(viewModel.savedCities, id: \.id) { city in
                button(city: city)
            }
            .onDelete(perform: viewModel.delete(at:))
        }
    }
    
    private func button(city: City) -> some View {
        Button {
            router.pushSavedCity(city)
        } label: {
            HStack(spacing: 16) {
                Text(city.name)
                    .foregroundStyle(
                        colorScheme == .light ? .black : .white
                    )
            }
        }
    }
}

#Preview {
    SavedCitiesView()
        .environment(WeatherRouter())
        .environment(
            CityViewModel(savedCities: [.chernivtsi, .ivanoFrankivsk, .lviv])
        )
}
