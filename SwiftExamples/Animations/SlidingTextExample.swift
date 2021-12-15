import SwiftUI

struct SlidingTextExample: View {
    @State var scroll1 = false
    @State var scroll2 = false
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello World")
                .font(.title.bold())
                .foregroundColor(.green)
                .frame(width: 300)
                .offset(x: scroll1 ? -75 : 75)
                .animation(.linear(duration: 2).repeatForever(), value: scroll1)
                .border(.red, width: 3)
                .onAppear(perform: {
                    scroll1.toggle()
                })
            
            Text("Hello World")
                .font(.title.bold())
                .foregroundColor(.blue)
                .frame(width: 300)
                .offset(x: scroll2 ? -225 : 225)
                .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: scroll2)
                .border(.red, width: 3)
                .clipped()
                .onAppear(perform: {
                    scroll2.toggle()
                })
        }
    }
}

struct AnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        SlidingTextExample()
    }
}
