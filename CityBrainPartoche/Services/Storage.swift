import Foundation

final class Storage {
    
    static let shared = Storage()
    private let defaults = UserDefaults.standard
    
    private init() {}
}

extension Storage {
    
    enum Key: String {
        
        case name
        case level
        case record
        case tipsPurchased
        case coins
        case isCollectionOpened
    }
    
    var level: Level {
        get {
            get(for: Key.level.rawValue) ?? .easy
        }
        set {
            set(newValue, for: Key.level.rawValue)
        }
    }
    
    var name: String {
        get {
            get(for: Key.name.rawValue) ?? ""
        }
        set {
            set(newValue, for: Key.name.rawValue)
        }
    }
    
    var record: Int {
        get {
            get(for: Key.record.rawValue) ?? 0
        }
        set {
            set(newValue, for: Key.record.rawValue)
        }
    }
    
    var tipsPurchased: [Int] {
        get {
            get(for: Key.tipsPurchased.rawValue) ?? []
        }
        set {
            set(newValue, for: Key.tipsPurchased.rawValue)
        }
    }
    
    var coins: Int {
        get {
            get(for: Key.coins.rawValue) ?? 0
        }
        set {
            set(newValue, for: Key.coins.rawValue)
        }
    }
    
    var isCollectionOpened: Bool {
        get {
            get(for: Key.isCollectionOpened.rawValue) ?? false
        }
        set {
            set(newValue, for: Key.isCollectionOpened.rawValue)
        }
    }
    
    
}

private extension Storage {
    
    func set<T: Codable>(_ value: T, for key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            defaults.set(encoded, forKey: key)
        }
    }

    func get<T: Codable>(for key: String) -> T? {
        guard let data = defaults.data(forKey: key),
              let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return decoded
    }

    func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
