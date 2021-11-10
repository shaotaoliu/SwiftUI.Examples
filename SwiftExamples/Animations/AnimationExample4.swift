import SwiftUI

struct AnimationExample4: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                TapMeButton(animationAmount: $animationAmount, axis: (x: 1, y: 0, z: 0))
                
                TapMeButton(animationAmount: $animationAmount, axis: (x: 0, y: 1, z: 0))
            }
            
            HStack {
                TapMeButton(animationAmount: $animationAmount, axis: (x: 0, y: 0, z: 1))
                
                TapMeButton(animationAmount: $animationAmount, axis: (x: 1, y: 1, z: 0))
            }
            
            HStack {
                TapMeButton(animationAmount: $animationAmount, axis: (x: 1, y: 0, z: 1))
                
                TapMeButton(animationAmount: $animationAmount, axis: (x: 0, y: 1, z: 1))
            }
            
            HStack {
                TapMeButton(animationAmount: $animationAmount, axis: (x: 1, y: 1, z: 1))
                
                Button("Tap Me") {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        animationAmount += 360
                    }
                }
                .padding(50)
                .background(.green)
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
    
    struct TapMeButton: View {
        @Binding var animationAmount: Double
        var axis: (x: CGFloat, y: CGFloat, z: CGFloat)
        
        var body: some View {
            Button("Tap Me") {
                withAnimation(.linear(duration: 1)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: axis)
        }
    }
}

struct AnimationExample4_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample4()
    }
}
