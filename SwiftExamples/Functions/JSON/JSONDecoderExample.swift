import Foundation

fileprivate struct Employee: Codable
{
    var id: Int
    var name: String
}

fileprivate struct Person: Codable
{
    var id: Int?
    var name: String
}

fileprivate func decode<T: Codable>(_ str: String) -> T? {
    let data = str.data(using: .utf8)!
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch {
        print("\(error)")
        return nil
    }
}

fileprivate func test1() {
    let str = "{\"id\":1,\"name\":\"Kevin\"}"
    let e: Employee = decode(str)!
    
    print(e.id)
    print(e.name)
}

fileprivate func test2() {
    let str = "{\"name\":\"Jason\"}"
    let e: Employee? = decode(str)
    print(e ?? "nil")

    /*
     keyNotFound(CodingKeys(stringValue: "id", intValue: nil), Swift.DecodingError.Context(codingPath: [], debugDescription: "No value associated with key CodingKeys(stringValue: \"id\", intValue: nil) (\"id\").", underlyingError: nil))
     */
    
    let p: Person = decode(str)!
    print(p)
    
    // Person(id: nil, name: "Jason")
}

fileprivate func test3() {
    // [Employee]
    var str = "[{\"id\":1,\"name\":\"Kevin\"},{\"id\":2,\"name\":\"Jason\"},{\"id\":3,\"name\":\"Bruce\"}]"
    let emps: [Employee] = decode(str)!
    
    for e in emps {
        print(e)
    }
    
    // [Int]
    str = "[1, 2, 3, 4, 5]"
    let arrInt: [Int] = decode(str)!

    for i in arrInt {
        print(i)
    }

    // [String]
    str = "[\"Kevin\", \"Jason\", \"Bruce\"]"
    let arrString: [String] = decode(str)!

    for str in arrString {
        print(str)
    }

    // [Int: String]
    str = "{\"2\":\"Jason\",\"3\":\"Bruce\",\"1\":\"Kevin\"}"
    let arrDic: [Int: String] = decode(str)!

    for (k, v) in arrDic {
        print("\(k), \(v)")
    }
}
