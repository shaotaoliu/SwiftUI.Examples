import SwiftUI

struct ScrollViewReaderExample2: View {
    @Namespace var topID
    @Namespace var bottomID
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    HStack {
                        Button("Go to bottom") {
                            proxy.scrollTo(bottomID)
                        }
                        
                        Spacer()
                        
                        Button("Go to 50") {
                            proxy.scrollTo(50)
                        }
                    }
                    .id(topID)
                    
                    ForEach(0..<100, id: \.self) { i in
                        HStack {
                            Text("Example \(i)")
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if i == 50 {
                                Button("Top") {
                                    proxy.scrollTo(topID)
                                }
                                
                                Button("Bottom") {
                                    proxy.scrollTo(bottomID)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Button("Go to top") {
                        withAnimation {
                            proxy.scrollTo(topID)
                        }
                    }
                    .id(bottomID)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ScrollViewReaderExample2_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderExample2()
    }
}
