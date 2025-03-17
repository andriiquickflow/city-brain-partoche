import SwiftUI

extension ChooseLevelView {
    
    final class ChooseLevelViewModel: ObservableObject {
        
        private let router: Router
        
        @Published var level: Level
        
        init(router: Router) {
            self.router = router
            self.level = Storage.shared.level
        }
        
        func makeEasy() {
            level = .easy
            Storage.shared.level = .easy
        }
        
        func makeMedium() {
            level = .medium
            Storage.shared.level = .medium
        }
        
        func makeHard() {
            level = .hard
            Storage.shared.level = .hard
        }
    }
}
