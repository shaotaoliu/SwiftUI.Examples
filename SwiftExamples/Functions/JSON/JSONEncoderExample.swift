import Foundation

fileprivate struct Employee: Codable
{
    var id: Int
    var name: String
}

fileprivate func encode<T: Codable>(_ e: T) -> String{
    let encoder = JSONEncoder()
    //encoder.outputFormatting = .prettyPrinted
    
    do {
        let data = try encoder.encode(e)
        return String(data: data, encoding: .utf8)!
    }
    catch {
        return error.localizedDescription
    }

}

fileprivate func test() {
    let e = Employee(id: 1, name: "Kevin")
    var str = encode(e)

    print(str)
    // {"id":1,"name":"Kevin"}
    
    let emps = [
        Employee(id: 1, name: "Kevin"),
        Employee(id: 2, name: "Jason"),
        Employee(id: 3, name: "Bruce")
    ]

    str = encode(emps)
    print(str)
    // [{"id":1,"name":"Kevin"},{"id":2,"name":"Jason"},{"id":3,"name":"Bruce"}]
    
    let arr = [1, 2, 3, 4, 5]
    str = encode(arr)

    print(str)
    // [1,2,3,4,5]
    
    let set: Set<String> = ["Kevin", "Jason", "Bruce"]
    str = encode(set)

    print(str)
    // ["Kevin","Jason","Bruce"]
    
    let dic = [1: "Kevin", 2: "Jason", 3: "Bruce"]
    str = encode(dic)

    print(str)
    // {"2":"Jason","3":"Bruce","1":"Kevin"}
}
