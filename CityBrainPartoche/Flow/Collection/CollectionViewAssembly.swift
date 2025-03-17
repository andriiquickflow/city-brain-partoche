import SwiftUI

final class CollectionViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = CollectionView.CollectionViewModel(router: router)

        return CollectionView(viewModel: viewModel)
    }
}
