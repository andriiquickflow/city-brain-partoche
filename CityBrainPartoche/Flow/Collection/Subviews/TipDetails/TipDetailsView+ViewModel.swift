import SwiftUI

extension TipDetailsView {
    
    final class TipDetailsViewModel: ObservableObject {
        
        let tip: Tip
        
        var textToShare: String {
            "\(tip.name): \(tip.description)"
        }
        
        private let router: Router
        
        init(tip: Tip, router: Router) {
            self.router = router
            self.tip = tip
        }
    }
}
