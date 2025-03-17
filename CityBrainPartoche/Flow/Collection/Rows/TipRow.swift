import SwiftUI

struct TipRow: View {
    
    let tip: Tip
    let purchased: Bool
    var handleOpen: () -> Void
    var handlePurchase: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(tip.name)
                .fontSystem(.title)
                .foregroundStyle(Color.tint)
            if purchased {
                HStack {
                    Spacer()
                    Button("Open") {
                        handleOpen()
                    }
                    .primary
                    .frame(width: 100)
                }
            } else {
                HStack {
                    Spacer()
                    HStack(spacing: 4) {
                        Text("\(tip.price)")
                            .fontSystem(.accent)
                        Image("coins")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.accent)
                    }
                    .foregroundStyle(Color.tint)
                    Button("Unlock") {
                        handlePurchase()
                    }
                    .secondary
                    .frame(width: 100)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay {
            RoundedRectangle(cornerRadius: .mainCornerRadius)
                .inset(by: 1)
                .stroke(Color.tint, lineWidth: 2)
        }
    }
}
