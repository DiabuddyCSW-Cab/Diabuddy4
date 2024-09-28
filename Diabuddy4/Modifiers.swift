import SwiftUI

// Hide Back Button View Modifier
struct HideBackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline) // Optional: Adjusts title display mode
    }
}

// View Extension to Use HideBackButton Modifier
extension View {
    func hideBackButton() -> some View {
        self.modifier(HideBackButton())
    }
}
