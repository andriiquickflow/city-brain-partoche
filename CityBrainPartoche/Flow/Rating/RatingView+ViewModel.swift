import SwiftUI

extension RatingView {
    
    final class RatingViewModel: ObservableObject {
        
        private let router: Router
        
        @Published var ratings: [Rating]
        
        init(router: Router) {
            self.router = router
            self.ratings = LoadFileService().loadItems(file: .ratings)
            self.relaod()
        }
        
        func relaod() {
            ratings = LoadFileService().loadItems(file: .ratings)
            if Storage.shared.record > 0 {
                ratings.append(.init(name: Storage.shared.name, score: Storage.shared.record, isCurrent: true))
            }
            ratings = ratings.sorted { $0.score > $1.score }
        }
    }
}
