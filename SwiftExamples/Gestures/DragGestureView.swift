import SwiftUI

struct DragGestureView: View {
    
    @State private var dragging = false
    @State private var dragOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    
    var body: some View {
        VStack {
            Circle()
                .fill(dragging ? .purple : .red)
                .shadow(radius: 20)
                .frame(width: 100)
                .offset(x: dragOffset.width + position.width, y: dragOffset.height + position.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragging = true
                            dragOffset = value.translation
                        }
                        .onEnded { value in
                            dragging = false
                            position.width += value.translation.width
                            position.height += value.translation.height
                            dragOffset = .zero
                        })
            
            Button("Restore") {
                dragOffset = .zero
                position = .zero
            }
            .padding()
        }
    }
    
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
