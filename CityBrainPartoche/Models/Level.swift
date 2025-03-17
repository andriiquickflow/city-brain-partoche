enum Level: String, Codable {
    
    case easy
    case medium
    case hard
    
    var score: Int {
        switch self {
        case .easy:
            return 5
        case .medium:
            return 15
        case .hard:
            return 25
        }
    }
    
    var mistakesLimit: Int {
        switch self {
        case .easy:
            return 8
        case .medium:
            return 5
        case .hard:
            return 3
        }
    }
}
