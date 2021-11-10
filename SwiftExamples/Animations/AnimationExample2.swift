import SwiftUI

struct AnimationExample2: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Circle()
                .fill(.red)
                .frame(width: 100)
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeInOut(duration: 2)
                                .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
        }
    }
}

struct AnimationExample2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample2()
    }
}
