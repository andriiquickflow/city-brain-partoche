import SwiftUI

extension AboutUsView {
    
    final class AboutUsViewModel: ObservableObject {
        
        private let router: Router
        
        init(router: Router) {
            self.router = router
        }
    }
}
