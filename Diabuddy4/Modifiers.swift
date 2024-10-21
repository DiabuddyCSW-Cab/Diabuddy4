import SwiftUI

struct HideBackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline) // Optional: Adjusts title display mode
    }
}

extension View {
    func hideBackButton() -> some View {
        self.modifier(HideBackButton())
    }
}
