import SwiftUI

extension CollectionView {
    
    final class CollectionViewModel: ObservableObject {
        
        @Published var brainBits: Int
        @Published var tips: [Tip]
        @Published var tipsPurchased: [Int]
        @Published var showError: Bool = false
        
        private let router: Router
        
        init(router: Router) {
            self.router = router
            self.brainBits = Storage.shared.brainBits
            self.tips = LoadFileService().loadItems(file: .tips)
            self.tipsPurchased = Storage.shared.tipsPurchased
        }
        
        func reload() {
            brainBits = Storage.shared.brainBits
            tipsPurchased = Storage.shared.tipsPurchased
        }
        
        func handleOpen(tip: Tip) {
            router.openTipDetails(tip: tip)
        }
        
        func handlePurchase(tip: Tip) {
            if tip.price > brainBits {
                showError = true
            } else {
                var tipsPurchased = Storage.shared.tipsPurchased
                tipsPurchased.append(tip.id)
                Storage.shared.tipsPurchased = tipsPurchased
                Storage.shared.brainBits = max(0, Storage.shared.brainBits - tip.price)
                reload()
                handleOpen(tip: tip)
            }
        }
    }
}
