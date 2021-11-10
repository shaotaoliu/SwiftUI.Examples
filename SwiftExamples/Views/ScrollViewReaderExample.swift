import SwiftUI

struct ScrollViewReaderExample: View {
    private var count = 100
    
    var body: some View {
        ScrollViewReader { proxy in
            HStack {
                Button("Go to bottom") {
                    proxy.scrollTo(count - 1)
                }
                
                Spacer()
                
                Button("Go to 50") {
                    proxy.scrollTo(50)
                }
            }
            
            List(0..<count) { i in
                Text("Example \(i)")
                    .id(i)
            }
            
            HStack {
                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(0)
                    }
                }
                
                Spacer()
                
                Button("Go to 50") {
                    withAnimation {
                        proxy.scrollTo(50, anchor: .top)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ScrollViewReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderExample()
    }
}
