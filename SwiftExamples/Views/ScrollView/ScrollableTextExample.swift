import SwiftUI

struct ScrollableTextExample: View {
    @State var text = "Hello Everyone: "
    @State var index = 0
    
    var body: some View {
        VStack {
            ScrollViewReader { reader in
                ScrollView {
                    Text(text)
                        .font(.title2)
                        .lineSpacing(10)
                        .id("textId")
                        .padding(1)
                }
                .frame(width: 300, height: 100, alignment: .topLeading)
                .border(.blue)
                .onChange(of: text, perform: { _ in
                    reader.scrollTo("textId", anchor: .bottom)
                })
            }
            
            Button("Append") {
                index += 1
                text += "A B C D \(index); "
            }
            .padding()
        }
    }
}

struct ScrollableTextExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableTextExample()
    }
}
