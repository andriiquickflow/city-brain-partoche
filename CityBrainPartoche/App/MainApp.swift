import SwiftUI

@main
struct MainApp: App {
    
    init() {
//        SoundService.shared.startAudio()
    }
    
    var body: some Scene {
        WindowGroup {
            home
                .mainBackground
                .fullScreenAutoLoader()
//            TabBarView(
//                items: [
//                    .init(title: "Tournament", icon: "tournament", view: AnyView(home)),
//                    .init(title: "Training", icon: "training", view: AnyView(training)),
//                    .init(title: "Collection", icon: "collection", view: AnyView(collection)),
//                    .init(title: "Rating", icon: "rating", view: AnyView(rating)),
//                    .init(title: "Settings", icon: "settings", view: AnyView(settings)),
//                ]
//            )
        }
    }
    
    var home: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: HomeViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    var training: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: TrainingViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    var collection: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: CollectionViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    var rating: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: RatingViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
    
    var settings: some View {
        let navigationService = NavigationService()
        return NavigationUIController(
            rootView: SettingsViewAssembly(navigationService: navigationService).view,
            coordinator: NavigationUICoordinator(navigationService: navigationService)
        )
        .ignoresSafeArea()
    }
}
