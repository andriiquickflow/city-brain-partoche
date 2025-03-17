import SwiftUI

extension SettingsView {
    
    final class SettingsViewModel: ObservableObject {
        
        private let router: Router
        
        @Published var name: String
        @Published var level: Level
        @Published var isPlaying: Bool
        
        init(router: Router) {
            self.router = router
            self.isPlaying = SoundService.shared.isPlaying
            self.name = Storage.shared.name
            self.level = Storage.shared.level
        }
        
        func reload() {
            self.isPlaying = SoundService.shared.isPlaying
            self.level = Storage.shared.level
            self.name = Storage.shared.name
        }
        
        func openChooseLevel() {
            router.openChooseLevel()
        }
        
        func changeSound() {
            SoundService.shared.changePlay()
            isPlaying = SoundService.shared.isPlaying
        }
        
        func openAboutUs() {
            router.openAboutUs()
        }
        
        func clearCache() {
            Storage.shared.name = ""
            Storage.shared.record = 0
            Storage.shared.level = .easy
            reload()
            UtilityService.triggerVibration()
        }
    }
}
