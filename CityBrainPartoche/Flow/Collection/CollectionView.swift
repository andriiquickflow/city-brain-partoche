import SwiftUI

struct CollectionView: View {
    
    @StateObject var viewModel: CollectionViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(viewModel.tips) { tip in
                    TipRow(
                        tip: tip,
                        purchased: viewModel.tipsPurchased.contains(tip.id),
                        handleOpen: {
                            viewModel.handleOpen(tip: tip)
                        },
                        handlePurchase: {
                            viewModel.handlePurchase(tip: tip)
                        }
                    )
                }
            }
            .padding(12)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 4) {
                    Text("BrickBits:")
                        .fontSystem(.text)
                    Text("\(viewModel.brainBits)")
                        .fontSystem(.accent)
                    Image("brainBits")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.accent)
                }
                .foregroundStyle(Color.tint)
            }
        }
        .alert("You don’t have enough BrickBits, participate in a quiz", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        }
        .onAppear {
            viewModel.reload()
        }
        .navigationTitle("Interesting Facts")
    }
}

struct CollectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        CollectionView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
