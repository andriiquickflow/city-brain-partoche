import SwiftUI

struct CollectionView: View {
    
    @StateObject var viewModel: CollectionViewModel
    @State var showBalanceAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Text("You can earn balance only by participating in quiz. It cannot be topped up with real money.")
                    .multilineTextAlignment(.center)
                    .fontSystem(.text)
                    .foregroundStyle(Color.tertiary)
                    .padding(.bottom, 12)
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
                    Text("Balance:")
                        .fontSystem(.text)
                    Text("\(viewModel.coins)")
                        .fontSystem(.accent)
                    Image("coins")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.accent)
                }
                .foregroundStyle(Color.tint)
            }
        }
        .alert("You don’t have enough coins, participate in a quiz", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        }
        .onAppear {
            viewModel.reload()
//            if !Storage.shared.isCollectionOpened {
//                Storage.shared.isCollectionOpened = true
//                showBalanceAlert = true
//            }
        }
//        .alert(
//            "Attention!",
//            isPresented: $showBalanceAlert,
//            actions: {
//                Button("Understood", role: .cancel) {}
//            },
//            message: {
//                Text("You can earn balance only by participating in quiz. It cannot be topped up with real money.")
//            }
//        )
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
