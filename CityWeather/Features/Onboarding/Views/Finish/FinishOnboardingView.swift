import SwiftUI

struct FinishOnboardingView: View {
    @Environment(OnboardingRouter.self) var router
    @AppStorage("passedOnboarding") private var passedOnboarding = false
    
    var body: some View {
        ZStack {
            finishOnboardingBackground
            VStack(spacing: 48) {
                SparklesView()
                VStack(spacing: 32) {
                    FinishOnboardingTitleView()
                    OnboardingButton("Почати") {
                        passedOnboarding = true
                        router.passOnboarding()
                    }
                }
            }
            .padding()
        }
    }
    
    private var finishOnboardingBackground: some View {
        Color.blue
            .opacity(0.45)
            .ignoresSafeArea()
    }
}

#Preview {
    FinishOnboardingView()
        .environment(WeatherRouter())
}
