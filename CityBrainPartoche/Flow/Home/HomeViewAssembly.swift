import SwiftUI

final class HomeViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = HomeView.HomeViewModel(router: router)

        return HomeView(viewModel: viewModel)
    }
}
