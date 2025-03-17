import SwiftUI

final class TipDetailsViewAssembly {
    
    private let navigationService: NavigationService
    private let tip: Tip
    
    init(tip: Tip, navigationService: NavigationService) {
        self.tip = tip
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = TipDetailsView.TipDetailsViewModel(tip: tip, router: router)

        return TipDetailsView(viewModel: viewModel)
    }
}
