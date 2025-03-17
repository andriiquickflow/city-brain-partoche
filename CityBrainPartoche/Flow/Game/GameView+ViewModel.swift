import SwiftUI

extension GameView {
    
    final class GameViewModel: ObservableObject {
        
        @Published var isTournament: Bool
        
        @Published var questions: [Question] = []
        @Published var questionIndex: Int = 0
        
        @Published var score: Int = 0
        @Published var mistakesLimit: Int
        
        @Published var isLost: Bool = false
        
        @Published var showResult: Bool = false
        
        private let router: Router
        
        init(categoryId: String?, router: Router) {
            self.router = router
            self.isTournament = categoryId == nil
            self.mistakesLimit = Storage.shared.level.mistakesLimit
            if categoryId == nil {
                questions = GameViewModel.randomizeQuestions()
            } else {
                let categories: [Category] = LoadFileService().loadItems(file: .questions)
                let newQuestions = categories.first(where: { $0.categoryId == categoryId })?.questions ?? []
                questions = newQuestions.shuffled()
                if newQuestions.isEmpty {
                    dismiss()
                }
            }
        }
        
        static func randomizeQuestions() -> [Question] {
            let categories: [Category] = LoadFileService().loadItems(file: .questions)
            
            return categories
                .flatMap { category in
                    let shuffledQuestions = category.questions.shuffled()
                    let selectedQuestions = Array(shuffledQuestions.prefix(2))
                    return selectedQuestions
                }
                .map {
                    .init(id: $0.id, title: $0.title, answers: $0.answers.shuffled())
                }
        }
        
        func handleAnswer(_ isCorrect: Bool) {
            if isTournament {
                if isCorrect {
                    score += Storage.shared.level.score
                } else {
                    mistakesLimit -= 1
                    if mistakesLimit == 0 {
                        isLost = true
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if self.mistakesLimit > 0 {
                    self.nextQuestion()
                }
            }
        }
        
        func nextQuestion() {
            questionIndex += 1
            if questionIndex >= questions.count {
                if isTournament {
                    if score > Storage.shared.record {
                        Storage.shared.record = score
                    }
                    Storage.shared.coins += score
                    showResult = true
                } else {
                    dismiss()
                }
            }
        }
        
        func dismiss() {
            router.dismiss()
        }
    }
}
