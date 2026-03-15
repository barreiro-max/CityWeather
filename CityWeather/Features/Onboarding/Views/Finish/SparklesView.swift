import SwiftUI

struct SparklesView: View {
    var body: some View {
        Image(systemName: "sparkles")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .symbolRenderingMode(.palette)
            .symbolEffect(.wiggle)
            .foregroundStyle(.yellow)
    }
}

#Preview {
    SparklesView()
}
