import SwiftUI

struct PropertyListExample: View {
    @State private var info: [Property] = []
    var body: some View {
        List {
            ForEach(info, id:\.key) { property in
                HStack {
                    Text(property.key)
                    Spacer()
                    Text(property.value)
                }
            }
        }
        .onAppear() {
            if let path = Bundle.main.path(forResource: "properties", ofType: "plist"),
               let plist = FileManager.default.contents(atPath: path),
               let dic = try? PropertyListSerialization.propertyList(from: plist, format: nil) as? [String: String] {
                   info = dic.map {
                       Property(key: $0.key, value: $0.value)
                }
            }
            
//            if let url = Bundle.main.url(forResource: "properties", withExtension: "plist"),
//               let plist = try? Data(contentsOf: url),
//               let dic = try? PropertyListSerialization.propertyList(from: plist, format: nil) as? [String: String] {
//                   info = dic.map {
//                       Property(key: $0.key, value: $0.value)
//                }
//            }
        }
    }
    
    struct Property {
        let key: String
        let value: String
    }
}

struct PropertyListExample_Previews: PreviewProvider {
    static var previews: some View {
        PropertyListExample()
    }
}
