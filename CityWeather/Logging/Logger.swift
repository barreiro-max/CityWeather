import OSLog

enum Logger {
    static let subsystem = "com.example.CityWeather"

    static let network = os.Logger(subsystem: subsystem, category: "network")
    static let data = os.Logger(subsystem: subsystem, category: "data")
    static let ui = os.Logger(subsystem: subsystem, category: "ui")
}
