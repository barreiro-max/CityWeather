import SwiftUI

struct SunView: View {
    @State private var isAnimating = false

    var body: some View {
        Image(systemName: "sun.max.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .symbolRenderingMode(.palette)
            .foregroundStyle(
                isAnimating ? .yellow : .orange,
                isAnimating ? .orange : .yellow
            )
            .rotationEffect(
                .degrees(isAnimating ? 360 : 0)
            )
            .animation(
                .easeInOut(duration: 3.2).repeatForever(),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}

#Preview {
    SunView()
}
