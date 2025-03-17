import SwiftUI

struct SecondaryButton: ButtonStyle {
    
    func color(isPressed: Bool) -> Color {
        isPressed ? Color.accent.opacity(0.3) : Color.accent
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .multilineTextAlignment(.center)
            .fontSystem(.accent)
            .foregroundStyle(color(isPressed: configuration.isPressed))
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(minHeight: 50)
            .background(Color.background)
            .overlay(
                RoundedRectangle(cornerRadius: .mainCornerRadius)
                    .inset(by: 1)
                    .stroke(color(isPressed: configuration.isPressed), lineWidth: 2)
            )
            .cornerRadius(.mainCornerRadius)
    }
}

extension Button {
    
    var secondary: some View {
        buttonStyle(SecondaryButton())
    }
}
