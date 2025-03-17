import SwiftUI

extension TrainingView {
    
    final class TrainingViewModel: ObservableObject {
        
        @Published var categories: [Category]
        private let router: Router
        
        init(router: Router) {
            self.router = router
            self.categories = LoadFileService().loadItems(file: .questions)
        }
        
        func openCategory(_ category: Category) {
            router.startGame(categoryId: category.categoryId)
        }
    }
}
