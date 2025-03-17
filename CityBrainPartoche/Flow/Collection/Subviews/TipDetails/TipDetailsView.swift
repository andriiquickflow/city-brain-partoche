import SwiftUI

struct TipDetailsView: View {
    
    @StateObject var viewModel: TipDetailsViewModel
    @State var showSharing: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(viewModel.tip.name)
                    .fontSystem(.title)
                    .foregroundStyle(Color.tint)
                
                Text(viewModel.tip.description)
                    .fontSystem(.text)
                    .foregroundStyle(Color.tint)
                
                Button("Share") {
                    showSharing = true
                }
                .secondary
                .padding(.top, 12)
            }
            .padding(12)
        }
        .background(
            ZStack {
                Image("tip")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.1)
                Color.black.opacity(0.4)
            }
        )
        .sheet(isPresented: $showSharing) {
            ActivityViewController(activityItems: [viewModel.textToShare])
        }
        .navigationTitle("Tip Details")
    }
}
