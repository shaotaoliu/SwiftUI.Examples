import SwiftUI

class KaychainManager {
    
    static func save(service: String, account: String, password: Data) {
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            print("Error: duplicate")
            return
        }
        
        if status != errSecSuccess {
            print("Status: \(status)")
            return
        }
        
        return
    }
    
    static func get(service: String, account: String) -> Data? {
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        print("Status: \(status)")
        return result as? Data
    }
}

extension KaychainManager {
    
    func getPassword() -> String? {
        guard let data = KaychainManager.get(service: "com.experian", account: "bliu") else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }

    func save(password: String) {
        let data = password.data(using: .utf8)!
        KaychainManager.save(service: "com.experian", account: "bliu", password: data)
    }
    
    func test() {
        save(password: "Password1")
        
        let password = getPassword()
        print(password ?? "")
    }
}

