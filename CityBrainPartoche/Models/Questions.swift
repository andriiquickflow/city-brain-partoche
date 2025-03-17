import Foundation

struct Category: Codable {
    
    let categoryId: String
    let title: String
    let questions: [Question]
}

struct Question: Codable {
    
    let id: String
    let title: String
    let answers: [Answer]
}

struct Answer: Codable {
    
    let text: String
    let isCorrect: Bool
}
