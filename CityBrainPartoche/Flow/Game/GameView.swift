import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            if viewModel.isTournament {
                if viewModel.showResult {
                    ResultView(score: viewModel.score, handleAction: viewModel.dismiss)
                } else {
                    HStack {
                        Text("🏆 Score: \(viewModel.score)")
                            .fontSystem(.accent)
                            .foregroundStyle(Color.tint)
                        Spacer()
                        Text("❤️ Health: \(viewModel.mistakesLimit)")
                                .fontSystem(.accent)
                                .foregroundStyle(Color.tint)
                    }
                }
            }
            if let question = viewModel.questions[safe: viewModel.questionIndex] {
                ScrollView {
                    QuestionView(title: question.title, answers: question.answers) { result in
                        viewModel.handleAnswer(result)
                    }
                }
            }
            Spacer()
        }
        .padding(12)
        .alert("Unfortunately, you lost", isPresented: $viewModel.isLost) {
            Button("OK", role: .cancel) {
                viewModel.dismiss()
            }
        }
        .navigationTitle(
            viewModel.showResult
                ? "Congratulations!"
                : "\(viewModel.questionIndex + 1)/\(viewModel.questions.count)"
        )
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView(
            viewModel: .init(
                categoryId: nil,
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
