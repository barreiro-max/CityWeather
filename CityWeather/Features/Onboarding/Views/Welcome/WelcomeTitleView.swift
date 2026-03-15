import SwiftUI

struct WelcomeTitleView: View {
    var body: some View {
        Text("Ласкаво просимо!")
            .font(.largeTitle)
            .bold()
        Text("Дізнавайтеся актуальну погоду у вашому місті та плануйте день без сюрпризів.")
            .font(.body)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    WelcomeTitleView()
}
