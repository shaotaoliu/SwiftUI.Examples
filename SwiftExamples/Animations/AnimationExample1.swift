import SwiftUI

struct AnimationExample1: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 0.5
            }
            .padding(35)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .animation(.default, value: animationAmount)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 0.5
            }
            .padding(35)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .animation(.interpolatingSpring(stiffness: 100, damping: 1), value: animationAmount)
            
            Spacer()
        }
    }
}

struct AnimationExample1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample1()
    }
}
