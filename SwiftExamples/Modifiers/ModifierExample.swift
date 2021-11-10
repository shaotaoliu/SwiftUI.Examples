import SwiftUI

struct ModifierExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello")
                .modifier(Title())
            
            Text("World")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
            
            Spacer()
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.title3)
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct ModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        ModifierExample()
    }
}
