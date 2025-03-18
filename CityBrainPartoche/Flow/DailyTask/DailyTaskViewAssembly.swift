import SwiftUI

final class DailyTaskViewAssembly {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    var view: some View {
        let router = Router(navigationService: navigationService)
        let viewModel = DailyTaskView.DailyTaskViewModel(router: router)

        return DailyTaskView(viewModel: viewModel)
    }
}
