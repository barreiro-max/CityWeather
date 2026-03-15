import SwiftUI

struct ShareWeatherView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    let city: City
    let weather: Weather
    
    private var sharedText: String {
        "Погода в місті \(city.name): \(Int(weather.temperature))°C, \(weather.description.localizedCapitalized)"
    }
    
    @State private var isCopy: Bool = false
    var body: some View {
        VStack(spacing: 24) {
            sharedTextLabel
            VStack(spacing: 16) {
                copyButton
                closeButton
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

extension ShareWeatherView {
    private var sharedTextLabel: some View {
        Text(sharedText)
            .padding()
            .background(.ultraThinMaterial)
            
            .foregroundStyle(
                isCopy
                ? .gray
                : (colorScheme == .light ? .black : .white)
            )
            .animation(.easeInOut(duration: 0.2), value: isCopy)
            .onTapGesture {
                isCopy.toggle()
                UIPasteboard.general.string = sharedText
            }
            .cornerRadius(8)
    }
    
    private var copyButton: some View {
        Button {
            UIPasteboard.general.string = sharedText
        } label: {
            Label("Скопіювати", systemImage: "doc.on.doc")
        }
    }
    
    private var closeButton: some View {
        Button("Закрити", role: .destructive) {
            dismiss()
        }
    }
}
