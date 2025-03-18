import SwiftUI

final class Router {
    
    private let navigationService: NavigationService
    
    init(navigationService: NavigationService) {
        self.navigationService = navigationService
    }
    
    func dismiss() {
        navigationService.pop()
    }
    
    func startGame(categoryId: String?) {
        let view = GameViewAssembly(categoryId: categoryId, navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openTipDetails(tip: Tip) {
        let view = TipDetailsViewAssembly(tip: tip, navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openChooseLevel() {
        let view = ChooseLevelViewAssembly(navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openTraining() {
        let view = TrainingViewAssembly(navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openDailyTask() {
        let view = DailyTaskViewAssembly(navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openCollection() {
        let view = CollectionViewAssembly(navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openRating() {
        let view = RatingViewAssembly(navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openSettings() {
        let view = SettingsViewAssembly(navigationService: navigationService).view
        navigationService.push(view)
    }
    
    func openAboutUs() {
        let view = AboutUsViewAssembly(navigationService: navigationService).view
        navigationService.push(view)
    }
}

