import SwiftUI

final class RatingViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = RatingView.RatingViewModel(router: router)

        return RatingView(viewModel: viewModel)
    }
}
