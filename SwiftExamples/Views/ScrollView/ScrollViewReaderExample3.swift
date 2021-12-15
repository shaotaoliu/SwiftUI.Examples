import SwiftUI

struct ScrollViewReaderExample3: View {
    @State var items = (1...20).map { "Item \($0)" }
    @State var newItem = ""
    
    var body: some View {
        VStack {
            TextField("Enter Text", text: $newItem, prompt: Text("Enter Item"))
                .textFieldStyle(.roundedBorder)
                .padding()
                .shadow(radius: 5)
                .onSubmit {
                    items.append(newItem)
                    newItem = ""
                }
            
            ScrollViewReader { proxy in
                List {
                    ForEach(items.indices, id: \.self) { index in
                        Text(items[index])
                            .id(index)
                    }
                }
                .listStyle(.plain)
                .onAppear() {
                    proxy.scrollTo(items.count - 1)
                }
                .onChange(of: items, perform: { _ in
                    proxy.scrollTo(items.count - 1)
                })
            }
        }
    }
}

struct ScrollViewReaderExample3_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderExample3()
    }
}
