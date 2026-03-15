import SwiftUI

struct OnboardingButton: View {
    let title: String
    let navigationAction: () -> ()
    
    init(
        _ title: String,
        navigationAction: @escaping () -> ()
    ) {
        self.title = title
        self.navigationAction = navigationAction
    }
    
    var body: some View {
        Button(action: navigationAction) {
            Text(title)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    OnboardingButton("Далі") {
        print("Перейти далі")
    }
}
