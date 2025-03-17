import SwiftUI

struct PrimaryButton: ButtonStyle {
    
    func color(isPressed: Bool) -> Color {
        isPressed ? Color.accent.opacity(0.3) : Color.accent
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .multilineTextAlignment(.center)
            .fontSystem(.accent)
            .foregroundStyle(Color.background)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(minHeight: 50)
            .background(color(isPressed: configuration.isPressed))
            .cornerRadius(.mainCornerRadius)
    }
}

extension Button {
    
    var primary: some View {
        buttonStyle(PrimaryButton())
    }
}
