import SwiftUI

final class TrainingViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = TrainingView.TrainingViewModel(router: router)

        return TrainingView(viewModel: viewModel)
    }
}
