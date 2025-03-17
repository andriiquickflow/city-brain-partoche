import SwiftUI

extension HomeView {
    
    final class HomeViewModel: ObservableObject {
        
        @Published var showNameeSheet: Bool = false
        
        private let router: Router
        
        init(router: Router) {
            self.router = router
        }
        
        func start() {
            guard !Storage.shared.name.isEmpty else {
                showNameeSheet = true
                return
            }
            router.startGame(categoryId: nil)
        }
        
        func openChooseLevel() {
            router.openChooseLevel()
        }
        
        func openTraining() {
            router.openTraining()
        }
        
        func openCollection() {
            router.openCollection()
        }
        
        func openRating() {
            router.openRating()
        }
        
        func openSettings() {
            router.openSettings()
        }
        
        func handleSaveName() {
            start()
        }
    }
}
