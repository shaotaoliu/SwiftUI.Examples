import SwiftUI

struct DragGestureExample2: View {
    
    let topOffset: CGFloat = 100
    let bottomOffset: CGFloat = 100
    
    @State private var dragOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    
    var body: some View {
        
        ZStack {
            Image("monalisa")
                .resizable()
                .scaledToFit()
                .frame(width: 165, height: 250)
                .clipped()
            
            Rectangle()
                .fill(.gray)
                .cornerRadius(20)
                .offset(y: topOffset + dragOffset.height + position.height)
                .gesture(dragGesture)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged {
                dragOffset = $0.translation
            }
            .onEnded { value in
                withAnimation {
                    // if at the top:
                    if position == .zero {
                        if value.translation.height < UIScreen.main.bounds.height / 2 {
                            position = .zero
                        }
                        else {
                            position.height = UIScreen.main.bounds.height - bottomOffset
                        }
                    }
                    // if at the bottom:
                    else {
                        if value.translation.height > -UIScreen.main.bounds.height / 2 {
                            position.height = UIScreen.main.bounds.height - bottomOffset
                        }
                        else {
                            position = .zero
                        }
                    }
                }
                
                dragOffset = .zero
            }
    }
}

struct DragGestureExample2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureExample2()
    }
}
