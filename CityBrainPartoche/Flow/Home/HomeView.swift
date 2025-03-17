import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("Start game") {
                viewModel.start()
            }
            .primary
            .padding(.horizontal, 12)
            Button("Choose Level") {
                viewModel.openChooseLevel()
            }
            .secondary
            .padding(.horizontal, 12)
            Button("Training") {
                viewModel.openTraining()
            }
            .secondary
            .padding(.horizontal, 12)
//            Button("Collection") {
//                viewModel.openCollection()
//            }
//            .secondary
//            .padding(.horizontal, 12)
            Button("Rating") {
                viewModel.openRating()
            }
            .secondary
            .padding(.horizontal, 12)
            Button("Settings") {
                viewModel.openSettings()
            }
            .secondary
            .padding(.horizontal, 12)
        }
        .padding(.vertical, 12)
        .background(
            ZStack {
                Image("main_h")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.1)
                Color.black.opacity(0.4)
            }
        )
        .sheet(isPresented: $viewModel.showNameeSheet) {
            NameView(handleSave: viewModel.handleSaveName)
        }
        .navigationTitle("City Brain Partoche")
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
