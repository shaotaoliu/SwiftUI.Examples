import SwiftUI

struct LongPressGestureExample: View {
    
    @State private var pressed = false
    @State private var pressing = false
    
    var body: some View {
        
        Circle()
            .fill(pressing ? .green : .red)
            .shadow(radius: 20)
            .frame(width: 200)
            .scaleEffect(pressed ? 0.5 : 1.0)
            .onLongPressGesture(minimumDuration: 1, maximumDistance: 400, perform: {
                withAnimation {
                    pressed.toggle()
                }
            }, onPressingChanged: { state in
                withAnimation {
                    pressing = state
                }
            })
        
    }
}

struct LongPressGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureExample()
    }
}
