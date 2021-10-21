import Foundation

fileprivate enum MyError: Error {
    case greaterThan10
    case greaterThan100(num: Int)
    case negative(str: String)
}

fileprivate func process(_ x: Int) throws -> String {
    if x > 100 {
        throw MyError.greaterThan100(num: x)
    }
    
    if x < 0 {
        throw MyError.negative(str: "negative")
    }
    
    if x > 10 {
        throw MyError.greaterThan10
    }
    
    return "passed"
}

fileprivate func test(_ x: Int)
{
    do {
        let result = try process(x)
        print(result)
    }
    catch MyError.greaterThan10 {
        print("> 10")
    }
    catch MyError.greaterThan100(let num) {
        print("> 100: \(num)")
    }
    catch MyError.negative(let str) {
        print("invalid: \(str)")
    }
    catch {
        print("error: \(error)")
    }
}

fileprivate func runtest() {
    test(1)          // passed
    test(20)         // > 10
    test(105)        // > 100: 105
    test(-1)         // invalid: negative
}

fileprivate func runtest2() {
    do {
        let a = try process(100)
        print(a)
    }
    catch is MyError {
        print("MyError")         // MyError
    }
    catch {
        print("error")
    }
    
    if let result2 = try? process(-1) {
        print("result: \(result2)")
    }
    else {
        print("nil")               // nil
    }
    
    let result3 = try! process(5)
    print(result3)                  // passed
}
