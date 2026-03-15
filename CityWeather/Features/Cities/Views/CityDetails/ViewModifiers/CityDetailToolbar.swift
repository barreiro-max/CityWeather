import SwiftUI

struct CityDetailToolbar: ViewModifier {
    
    let city: City
    let saveAction: (City) -> Void
    let deleteAction: (City) -> Void
    let shareAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    
                    Button("Поділитись") {
                        shareAction()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                        saveAction(city)
                    } label: {
                        Image(systemName: "star")
                    }
                    
                    Button(role: .destructive) {
                        deleteAction(city)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
    }
}

extension View {
    func cityDetailToolbar(
        city: City,
        onSave: @escaping (City) -> Void,
        onDelete: @escaping (City) -> Void,
        onShare: @escaping () -> Void
    ) -> some View {
        modifier(
            CityDetailToolbar(
                city: city,
                saveAction: onSave,
                deleteAction: onDelete,
                shareAction: onShare
            )
        )
    }
}
