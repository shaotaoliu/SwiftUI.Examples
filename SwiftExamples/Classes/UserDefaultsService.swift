import Foundation

class UserDefaultsService {
    static let shared = UserDefaultsService()
    
    private init() {}
    
    func save(model: UserDefaultsModel) {
        UserDefaults.standard.set(model.name, forKey: "UserDefaultsExample.name")
        UserDefaults.standard.set(model.count, forKey: "UserDefaultsExample.count")
        UserDefaults.standard.set(model.expired, forKey: "UserDefaultsExample.expired")
    }
    
    func fetch() -> UserDefaultsModel {
        var model = UserDefaultsModel()
        model.name = UserDefaults.standard.string(forKey: "UserDefaultsExample.name") ?? ""
        model.count = UserDefaults.standard.integer(forKey: "UserDefaultsExample.count")
        model.expired = UserDefaults.standard.bool(forKey: "UserDefaultsExample.expired")
        return model
    }
    
    func saveAsOne(model: UserDefaultsModel) {
        let data = try! JSONEncoder().encode(model)
        UserDefaults.standard.set(data, forKey: "UserDefaultsExample.data")
    }
    
    func fetchAsOne() -> UserDefaultsModel {
        if let data = UserDefaults.standard.data(forKey: "UserDefaultsExample.data") {
            return try! JSONDecoder().decode(UserDefaultsModel.self, from: data)
        }
        return UserDefaultsModel()
    }
}

struct UserDefaultsModel: Codable {
    var name: String = ""
    var count: Int = 0
    var expired: Bool = false
}
