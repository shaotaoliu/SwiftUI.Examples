import Foundation

enum LocalizedErrorExample: Error, LocalizedError {
    case empty
    case too_short
    case too_long
    case invalid
    
    var errorDescription: String? {
        switch self {
        case .empty:
            return NSLocalizedString("Value cannot be empty", comment: "")
            
        case .too_short:
            return NSLocalizedString("Value is too short", comment: "")
            
        case .too_long:
            return NSLocalizedString("Value is too long", comment: "")
            
        case .invalid:
            return NSLocalizedString("Invalid value", comment: "")
        }
    }
}

fileprivate func check(_ value: String) throws {
    if value.isEmpty {
        throw LocalizedErrorExample.empty
    }
    
    if value.count < 5 {
        throw LocalizedErrorExample.too_short
    }
    
    if value.count > 20 {
        throw LocalizedErrorExample.too_long
    }
    
    if value.contains("$") {
        throw LocalizedErrorExample.invalid
    }
}

fileprivate func test(_ value: String) {
    do {
        try check(value)
    }
    catch {
        print(error.localizedDescription)
    }
}

fileprivate func run_test() {
    test("")
    test("abc")
    test("abcdefghijklmnopqrstuvwxyz")
    test("abc$xyz")
}

// run_test()
