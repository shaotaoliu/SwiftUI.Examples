import SwiftUI

struct MenuExample: View {
    let colors = ["Red", "Green", "Blue"]
    @State private var name = ""
    @State private var color = "Red"
    
    var body: some View {
        VStack(spacing: 30) {
            // press Control and tap:
            Text("ContentMenu: \(name)")
                .contextMenu {
                    Button("Jason", action: { name = "Jason" })
                    Button("Smith", action: { name = "Smith" })
                    Button("Kevin", action: { name = "Kevin" })
                    Menu("Others") {
                        Button("Liu", action: { name = "Liu" })
                        Button("Wang", action: { name = "Wang" })
                    }
                }
            
            Menu("Menu") {
                Button("Cut", action: { })
                Button("Paste", action: { })
                Button("Copy", action: { })
                Menu("Advanced") {
                    Button("Create", action: { })
                    Button("Delete", action: { })
                }
            }
            
            Menu {
                Button("Cut", action: { })
                Button("Paste", action: { })
                Button("Copy", action: { })
            } label: {
                Label("Menu", systemImage: "paperplane")
            }
            
            Menu("Menu", content: {
                Button("Cut", action: { })
                Button("Paste", action: { })
                Button("Copy", action: { })
            }, primaryAction: {
                //
            })
            
            Picker("Select a color", selection: $color) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            
            Text(color)
        }
    }
}

struct MenuExample_Previews: PreviewProvider {
    static var previews: some View {
        MenuExample()
    }
}
