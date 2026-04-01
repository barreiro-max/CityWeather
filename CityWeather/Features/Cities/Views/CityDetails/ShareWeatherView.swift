import SwiftUI

struct ShareWeatherView: View {
    let cityName: String
    let temperature: Double
    let description: String

    private var sharedText: String {
        "Погода в місті \(cityName): \(Int(temperature))°C, \(description.localizedCapitalized)"
    }

    var body: some View {
        ShareLink(item: sharedText) {
            Label("Поділитися", systemImage: "doc.on.doc")
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ShareWeatherView(
        cityName: "Одеса",
        temperature: 12,
        description: "Чисте небо"
    )
}
