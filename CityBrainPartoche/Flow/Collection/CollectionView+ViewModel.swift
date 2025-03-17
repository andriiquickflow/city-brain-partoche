import SwiftUI

extension CollectionView {
    
    final class CollectionViewModel: ObservableObject {
        
        @Published var coins: Int
        @Published var tips: [Tip]
        @Published var tipsPurchased: [Int]
        @Published var showError: Bool = false
        
        private let router: Router
        
        init(router: Router) {
            self.router = router
            self.coins = Storage.shared.coins
            self.tips = LoadFileService().loadItems(file: .tips)
            self.tipsPurchased = Storage.shared.tipsPurchased
        }
        
        func reload() {
            coins = Storage.shared.coins
            tipsPurchased = Storage.shared.tipsPurchased
        }
        
        func handleOpen(tip: Tip) {
            router.openTipDetails(tip: tip)
        }
        
        func handlePurchase(tip: Tip) {
            if tip.price > coins {
                showError = true
            } else {
                var tipsPurchased = Storage.shared.tipsPurchased
                tipsPurchased.append(tip.id)
                Storage.shared.tipsPurchased = tipsPurchased
                Storage.shared.coins = max(0, Storage.shared.coins - tip.price)
                reload()
                handleOpen(tip: tip)
            }
        }
    }
}
