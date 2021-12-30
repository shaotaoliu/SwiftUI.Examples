import SwiftUI

struct UIBezierPathExample: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello World")
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(ChatBubble())
            
            
            ChatBubble()
                .fill(.green)
                .frame(width: 200, height: 60)
            
            UIBezierPath1()
                .fill(.red)
                .frame(width: 200, height: 60)
        }
    }
}

struct ChatBubble: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topRight, .bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: 15, height: 15))
        
        return Path(path.cgPath)
    }
}

struct UIBezierPath1: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 50, y: 150))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: .zero)
        
        return Path(path.cgPath)
    }
}

struct UIBezierPathExample_Previews: PreviewProvider {
    static var previews: some View {
        UIBezierPathExample()
    }
}
