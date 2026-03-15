import SwiftUI

struct CityContextMenu: ViewModifier {
    let city: City
    let saveAction: (City) -> Void
    let deleteAction: (City) -> Void
    
    func body(content: Content) -> some View {
        content
            .contextMenu {
                Button {
                    saveAction(city)
                } label: {
                    Label("Додати в обране", systemImage: "star")
                }
                
                Button(role: .destructive) {
                    deleteAction(city)
                } label: {
                    Label("Прибрати з обраного", systemImage: "trash")
                }
            }
    }
}

extension View {
    func cityContextMenu(
        city: City,
        save: @escaping (City) -> Void,
        delete: @escaping (City) -> Void
    ) -> some View {
        modifier(
            CityContextMenu(
                city: city,
                saveAction: save,
                deleteAction: delete
            )
        )
    }
}
