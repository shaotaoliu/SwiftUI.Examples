import SwiftUI

struct TransitionExample: View {
    @State private var shows = [true, true, true, true]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 60) {
                HStack(spacing: 60) {
                    if shows[0] {
                        Circle()
                            .fill(.red)
                            .frame(width: 100, height: 100)
                            .transition(.opacity)
                    }
                    
                    if shows[1] {
                        Circle()
                            .fill(.green)
                            .frame(width: 100, height: 100)
                            .transition(.scale)
                    }
                }
                
                HStack(spacing: 60) {
                    if shows[2] {
                        Circle()
                            .fill(.blue)
                            .frame(width: 100, height: 100)
                            .transition(.move(edge: .bottom))
                    }
                    
                    if shows[3] {
                        Circle()
                            .fill(.brown)
                            .frame(width: 100, height: 100)
                            .transition(.slide)
                    }
                }
            }
            .toolbar(content: {
                HStack(spacing: 20) {
                    Spacer()
                    
                    ForEach(0..<4) { i in
                        Button(["opacity", "scale", "move", "slide"][i]) {
                            withAnimation {
                                shows[i] = false
                            }
                        }
                    }
                    
                    Button("reset") {
                        for i in 0..<4 {
                            shows[i] = true
                        }
                    }
                    
                    Spacer()
                }
            })
        }
    }
}

struct TransitionExample_Previews: PreviewProvider {
    static var previews: some View {
        TransitionExample()
    }
}
