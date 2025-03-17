import SwiftUI

struct ChooseLevelView: View {
    
    @StateObject var viewModel: ChooseLevelViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                levelView(name: "easy", isSelected: viewModel.level == .easy, action: viewModel.makeEasy)
                levelView(name: "medium", isSelected: viewModel.level == .medium, action: viewModel.makeMedium)
                levelView(name: "hard", isSelected: viewModel.level == .hard, action: viewModel.makeHard)
            }
            .padding(.vertical, 12)
        }
        .navigationTitle("Choose Level")
    }
    
    func levelView(name: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(name)
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(.mainCornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: .mainCornerRadius)
                            .inset(by: 1)
                            .stroke(isSelected ? .accent : .clear, lineWidth: 2)
                    )
                Text(name)
                    .fontSystem(isSelected ? .accent : .text)
                    .foregroundStyle(isSelected ? .accent : .tertiary)
            }
        }
    }
}

struct ChooseLevelView_Previews: PreviewProvider {
    
    static var previews: some View {
        ChooseLevelView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
