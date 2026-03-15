import SwiftUI

extension CityDetailStateView {
    
    func descriptionLabel(with weather: Weather) -> some View {
        VStack {
            let urlString = "https://openweathermap.org/img/wn/\(weather.icon)@2x.png"
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
                    
            Text(weather.description.capitalized)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
    
    func temperatureLabel(with temperature: Double) -> some View {
        VStack {
            Text("\(Int(temperature))°C")
                .valueLabelStyle()
            Text("Температура")
                .captionLabelStyle()
        }
    }
    
    func feelsLikeLabel(with feelsLike: Double) -> some View {
        VStack {
            Text("\(Int(feelsLike))°C")
                .valueLabelStyle()
            Text("Відчувається як")
                .captionLabelStyle()
        }
    }
    
    func humidityLabel(with humidity: Int) -> some View {
        VStack {
            Text("\(humidity)%")
                .valueLabelStyle()
            Text("Вологість")
                .captionLabelStyle()
        }
    }
    
    func windSpeedLabel(with windSpeed: Double) -> some View {
        VStack {
            Text("\(windSpeed, specifier: "%.1f") м/с")
                .valueLabelStyle()
            Text("Вітер")
                .captionLabelStyle()
        }
    }
}
