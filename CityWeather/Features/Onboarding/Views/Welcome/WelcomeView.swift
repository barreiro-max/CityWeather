import SwiftUI

struct WelcomeView: View {
    @Environment(OnboardingRouter.self) var router
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.path) {
            ZStack {
                welcomeBackground
                VStack(spacing: 48) {
                    SunView()
                    VStack(spacing: 32) {
                        WelcomeTitleView()
                        OnboardingButton("Далі") {
                            router.push(.finishOnboarding)
                        }
                    }
                }
                .padding()
            }
            .weatherNavigation()
        }
    }
    
    private var welcomeBackground: some View {
        Color.blue
            .opacity(0.15)
            .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
        .environment(WeatherRouter())
}

