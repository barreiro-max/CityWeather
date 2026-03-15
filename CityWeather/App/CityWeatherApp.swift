//
//  CityWeatherApp.swift
//  CityWeather
//
//  Created by MaxAdmin on 13.03.2026.
//

import SwiftUI

@main
struct CityWeatherApp: App {
    @State var weatherViewModel = WeatherViewModel(
        repository: RemoteWeatherRepository(
            dataSource: WeatherFetcher()
        )
    )
    
    @State var onboardingRouter = OnboardingRouter()
    
    @AppStorage("passedOnboarding") private var passedOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if passedOnboarding {
                WeatherTabBar()
                    .environment(weatherViewModel)
            } else {
                WelcomeView()
                    .environment(onboardingRouter)
            }
        }
        
    }
}
