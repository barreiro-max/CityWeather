import SwiftUI

struct FinishOnboardingTitleView: View {
    var body: some View {
        Text("Почнемо подорож?")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("Натисніть кнопку нижче, щоб відкрити всі можливості додатку.")
            .font(.body)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        
    }
}

#Preview {
    FinishOnboardingTitleView()
}
