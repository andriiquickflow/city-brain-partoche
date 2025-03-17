import SwiftUI

struct QuestionView: View {
    
    let title: String
    let answers: [Answer]
    let answerAction: (Bool) -> Void
    
    @State var selectedAnswer: String?
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .multilineTextAlignment(.center)
                .fontSystem(.title)
                .foregroundStyle(Color.tint)
                .padding(.horizontal, 12)
            ForEach(answers.indexedItems, id: \.offset) { _, answer in
                Button("\(answer.text)\(answer.text == selectedAnswer ? " \(answer.isCorrect ? "✅" : "❌")" : "")") {
                    selectedAnswer = answer.text
                    answerAction(answer.isCorrect)
                }
                .secondary
            }
        }
        .onChange(of: title) { _ in
            selectedAnswer = nil
        }
        .disabled(selectedAnswer != nil)
        .padding(.vertical, 12)
    }
}
