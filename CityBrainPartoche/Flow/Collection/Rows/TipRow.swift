import SwiftUI

struct TipRow: View {
    
    let tip: Tip
    let purchased: Bool
    var handleOpen: () -> Void
    var handlePurchase: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 4) {
                Text(tip.name)
                    .fontSystem(.title)
                    .foregroundStyle(Color.tint)
                Spacer()
                Text("\(tip.price)")
                    .fontSystem(.accent)
                Image("brainBits")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.accent)
            }
            .foregroundStyle(Color.tint)
            if purchased {
                HStack {
                    Spacer()
                    Button("Open") {
                        handleOpen()
                    }
                    .primary
                }
            } else {
                HStack {
                    Spacer()
                    Button("Unlock") {
                        handlePurchase()
                    }
                    .secondary
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay {
            RoundedRectangle(cornerRadius: .mainCornerRadius)
                .inset(by: 1)
                .stroke(Color.tint, lineWidth: 2)
        }
    }
}
