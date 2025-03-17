import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: SettingsViewModel
    @State var showNameeSheet: Bool = false
    @State var showClearCacheAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            Image("main_h")
                .resizable()
                .frame(height: UIScreen.main.bounds.width / 2)
            Button(viewModel.name.isEmpty ? "Set name" : "Name: \(viewModel.name)") {
                showNameeSheet = true
            }
            .secondary
            .padding(.horizontal, 12)
            Button("Level: \(viewModel.level)", action: viewModel.openChooseLevel)
                .secondary
                .padding(.horizontal, 12)
            Button(viewModel.isPlaying ? "Sound: on" : "Sound: off", action: viewModel.changeSound)
                .secondary
                .padding(.horizontal, 12)
            Button("About Us", action: viewModel.openAboutUs)
                .secondary
                .padding(.horizontal, 12)
            Button("Clear cache") {
                viewModel.clearCache()
                showClearCacheAlert = true
            }
            .secondary
            .padding(.horizontal, 12)
            Spacer()
        }
        .padding(.vertical, 12)
        .alert("Success", isPresented: $showClearCacheAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Your cache cleared")
        }
        .sheet(isPresented: $showNameeSheet) {
            NameView(handleSave: viewModel.reload)
        }
        .onAppear {
            viewModel.reload()
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
