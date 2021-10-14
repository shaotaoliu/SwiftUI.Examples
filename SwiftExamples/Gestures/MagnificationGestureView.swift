import SwiftUI

struct MagnificationGestureView: View {
    
    // press "option" to test
    @State private var currentMagnification: CGFloat = 1
    @GestureState private var pinchMagnification: CGFloat = 1
    
    var body: some View {
        
        Circle()
            .fill(.red)
            .shadow(radius: 20)
            .frame(width: 100)
            .scaleEffect(currentMagnification * pinchMagnification)
            .gesture(
                MagnificationGesture()
                    .updating($pinchMagnification) { value, state, _ in
                        state = value
                    }
                    .onEnded {
                        currentMagnification *= $0
                    }
            )
    }
}

struct MagnificationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureView()
    }
}
