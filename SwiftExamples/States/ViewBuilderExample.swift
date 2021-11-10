import SwiftUI

struct ViewBuilderExample: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .purple]
    var body: some View {
        VStack {
            Container1 {
                Text("Hello")
                Text("How are you")
                Text("Good morning")
            }
            
            Divider()
                .padding()
            
            GridStack(rows: 3, columns: 3) { row, col in
                HStack {
                    Image(systemName: "\(row * 3 + col).circle")
                    Text("R\(row) C\(col)")
                }
                .foregroundColor(colors[(row * 3 + col) % colors.count])
                .padding(5)
            }
        }
    }
}

struct ViewBuilderExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderExample()
    }
}


struct Container1<Content: View>: View {
    var content : Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color.green)
            .cornerRadius(20)
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
