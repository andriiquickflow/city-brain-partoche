import SwiftUI

struct AboutUsView: View {
    
    @StateObject var viewModel: AboutUsViewModel
    
    var body: some View {
        ScrollView {
            Text("City Brain Partoche is an interactive quiz app designed to test and expand your knowledge about cities. From historical events to modern landmarks, the app offers a variety of engaging questions that challenge players to explore different aspects of urban life.\n\nWith categories covering City History, Architecture & Landmarks, Transport & Streets, Culture & Art, Geography & Nature, and Modern Life, users can dive into the past, present, and unique characteristics of cities worldwide.\n\nEarn points, climb leaderboards, and compete with friends while discovering fascinating facts about the places you know and love. Whether you're a local expert or an urban explorer, City Brain Partoche makes learning about cities fun and engaging.")
                .fontSystem(.text)
                .foregroundStyle(.accent)
                .padding(12)
        }
        .navigationTitle("About Us")
    }
}

struct AboutUsView_Previews: PreviewProvider {
    
    static var previews: some View {
        AboutUsView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
