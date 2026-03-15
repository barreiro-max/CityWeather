import SwiftUI

struct ValueLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
    }
}

struct CaptionLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

extension View {
    func valueLabelStyle() -> some View {
        modifier(ValueLabelStyle())
    }
    
    func captionLabelStyle() -> some View {
        modifier(CaptionLabelStyle())
    }
}
