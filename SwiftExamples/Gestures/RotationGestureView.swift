import SwiftUI

struct RotationGestureView: View {
    
    @State private var currentRotation = Angle.zero
    @GestureState private var twistAngle = Angle.zero
    @State private var currentMagnification: CGFloat = 1
    @GestureState private var pinchMagnification: CGFloat = 1
    
    var body: some View {
        Rectangle()
            .fill(Color.red)
            .shadow(radius: 20)
            .frame(width: 200, height: 200)
            .scaleEffect(currentMagnification * pinchMagnification)
            .rotationEffect(currentRotation + twistAngle)
            .gesture(rotationGesture
                        .simultaneously(with: magnificationGesture)
            )
    }
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .updating($twistAngle) { value, state, _ in
                state = value
            }
            .onEnded {
                self.currentRotation += $0
            }
    }
    
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .updating($pinchMagnification) { value, state, _ in
                state = value
            }
            .onEnded {
                self.currentMagnification *= $0
            }
    }
}

struct RotationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureView()
    }
}
