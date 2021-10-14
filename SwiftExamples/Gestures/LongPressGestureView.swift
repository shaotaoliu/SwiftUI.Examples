import SwiftUI

struct LongPressGestureView: View {
    
    @State private var pressed = false
    @State private var pressing = false
    
    var body: some View {
        
        Circle()
            .fill(pressing ? .green : .red)
            .shadow(radius: 20)
            .frame(width: 200)
            .scaleEffect(pressed ? 0.5 : 1.0)
            .animation(.easeIn(duration: 0.5))
            .onLongPressGesture(minimumDuration: 1, maximumDistance: 400,
                perform: {
                    pressed.toggle()
                },
                onPressingChanged: { state in
                    pressing = state
                })

    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureView()
    }
}
