import Foundation

/*
 To convert a Foundation object to JSON, the object must have the following properties:
 - The top level object is an NSArray or NSDictionary, unless you set the fragmentsAllowed option.
 - All objects are instances of NSString, NSNumber, NSArray, NSDictionary, or NSNull.
 - All dictionary keys are instances of NSString.
 - Numbers are neither NaN or infinity.
 */

fileprivate func toString(withJSONObject obj: Any, options opt: JSONSerialization.WritingOptions = []) -> String {
    do {
        let data = try JSONSerialization.data(withJSONObject: obj, options: opt)
        return String(data: data, encoding: .utf8)!
    }
    catch {
        return error.localizedDescription
    }
}

fileprivate func test1() {
    let arrInt = [1, 2, 3, 4, 5]
    var str = toString(withJSONObject: arrInt, options: [])

    print(str)
    // [1,2,3,4,5]
    
    let dic = ["1": "Kevin", "2": "Jason", "3": "Bruce"]
    str = toString(withJSONObject: dic, options: [.prettyPrinted])

    print(str)
    /*
     {
       "2" : "Jason",
       "1" : "Kevin",
       "3" : "Bruce"
     }
     */
}

fileprivate func toJson(_ str: String) -> Any? {
    let data = str.data(using: .utf8)!
    
    do {
        return try JSONSerialization.jsonObject(with: data, options: [])
    }
    catch {
        print("\(error)")
        return nil
    }
}


fileprivate func test2() {
    
    var str = "[1, 2, 3, 4, 5]"
    if let arr = toJson(str) as? [Int] {
        for i in arr {
            print(i)
        }
    }

    str = "[1, 2, 3, 4, hello]"
    if let arr = toJson(str) as? [Int] {
        for i in arr {
            print(i)
        }
    }
    // Error Domain=NSCocoaErrorDomain Code=3840 "Invalid value around character 13." UserInfo={NSDebugDescription=Invalid value around character 13.}

    str = "[\"Kevin\", \"Jason\", \"Bruce\"]"
    if let arr = toJson(str) as? [String] {
        for str in arr {
            print(str)
        }
    }

    str = "{\"1\":\"Jason\",\"2\":\"Bruce\",\"3\":\"Kevin\"}"
    if let arr = toJson(str) as? [String: String] {
        for (k, v) in arr {
           print("\(k), \(v)")
        }
    }
}
