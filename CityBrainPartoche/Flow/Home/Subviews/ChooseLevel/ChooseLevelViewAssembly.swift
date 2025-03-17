import SwiftUI

final class ChooseLevelViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = ChooseLevelView.ChooseLevelViewModel(router: router)

        return ChooseLevelView(viewModel: viewModel)
    }
}
