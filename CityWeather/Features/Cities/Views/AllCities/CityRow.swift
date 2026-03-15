import SwiftUI

struct CityRow: View {
    @Environment(CitiesRouter.self) private var router
    @Environment(\.colorScheme) private var colorScheme
    let city: City
    
    var body: some View {
        Button {
            router.pushCity(city)
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
    CityRow(city: .ivanoFrankivsk)
        .environment(CitiesRouter())
}
