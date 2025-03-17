import SwiftUI

final class GameViewAssembly {
    
    private let navigationService: NavigationService
    private let categoryId: String?
    
    init(categoryId: String?, navigationService: NavigationService) {
        self.categoryId = categoryId
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = GameView.GameViewModel(categoryId: categoryId, router: router)

        return GameView(viewModel: viewModel)
    }
}
