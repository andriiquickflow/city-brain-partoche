import SwiftUI

struct ResultView: View {
    
    let score: Int
    var handleAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Text("You have completed the quiz")
                .fontSystem(.text)
                .foregroundStyle(Color.tint)
            
            HStack(spacing: 4) {
                Text("Your Score: \(score)")
                    .fontSystem(.accent)
//                Image("coins")
//                    .resizable()
//                    .frame(width: 24, height: 24)
//                    .foregroundStyle(Color.accent)
            }
            .foregroundStyle(Color.tint)
            
            Button("Finish", action: handleAction)
                .primary
            
            Spacer()
        }
        .padding(12)
        .padding(.top, 40)
    }
}
