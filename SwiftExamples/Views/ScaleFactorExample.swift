import SwiftUI

struct ScaleFactorExample: View {
    @State var content = "Hello World, "
    private var text = "Hello World, "
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text(content)
                    .padding(10)
                    .minimumScaleFactor(0.01)
            }
            .frame(width: 300, height: 160, alignment: .topLeading)
            .border(.blue)
            
            Button("Append") {
                content += text
            }
            
            Button("Remove") {
                if content.count > text.count {
                    content.removeLast(text.count)
                }
            }
        }
        .font(.title)
    }
}

struct ScaleFactorExample_Previews: PreviewProvider {
    static var previews: some View {
        ScaleFactorExample()
    }
}
