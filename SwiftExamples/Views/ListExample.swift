import SwiftUI

struct ListExample: View {
    var body: some View {
        VStack {
            List(folders, children: \.subfolder) { item in
                Text("\(item.description)")
            }
            .listStyle(.plain)
            
//            List {
//                OutlineGroup(folders, children: \.subfolder) { file in
//                    Text(file.description)
//                }
//            }
//            .listStyle(.plain)
        }
        .padding()
    }
}

struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    let id = UUID()
    var name: String
    var subfolder: [FileItem]? = nil
    
    var description: String {
        subfolder == nil ? "📄 \(name)" : subfolder!.isEmpty ? "📂 \(name)" : "📁 \(name)"
    }
}

let folders = [
    FileItem(name: "Documents", subfolder: [
        FileItem(name: "Notes", subfolder: [
            FileItem(name: "C++"),
            FileItem(name: "Java"),
            FileItem(name: "Swift")
        ]),
        FileItem(name: "Stocks", subfolder: [
            FileItem(name: "Apple"),
            FileItem(name: "Tesla"),
            FileItem(name: "Visa")
        ])
    ]),
    FileItem(name: "Others", subfolder: [
        FileItem(name: "Photos", subfolder: [
            FileItem(name: "Park"),
            FileItem(name: "Beach"),
            FileItem(name: "Hiking")
        ]),
        FileItem(name: "Videos", subfolder: [
            FileItem(name: "Action"),
            FileItem(name: "Scary")
        ])
    ])
]

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
