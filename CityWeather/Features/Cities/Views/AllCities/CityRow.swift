import SwiftUI

struct CityRow: View {
    @Environment(CitiesRouter.self) private var router
    let city: City
    
    var body: some View {
        Button {
            router.pushCity(city)
        } label: {
            HStack(spacing: 16) {
                Text(city.name)
                    .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    CityRow(city: .ivanoFrankivsk)
        .environment(CitiesRouter())
}
