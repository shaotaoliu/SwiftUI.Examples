import Foundation

class Store: ObservableObject {
    @Published var items = [
        Item(name: "Apple", description: "This is an apple"),
        Item(name: "Sun", description: "There is a sun in the sky"),
        Item(name: "Book", description: "I like books")
    ]
    
    let name = "This is a Store object"
}

struct Item {
    let id = UUID()
    var name: String = ""
    var description: String = ""
}
