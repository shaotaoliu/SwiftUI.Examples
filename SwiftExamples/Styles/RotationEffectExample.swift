import SwiftUI

struct RotationEffectExample: View {
    var body: some View {
        VStack(spacing: 50) {
            Button("Hello World") {
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .rotationEffect(.degrees(45))
            
            
            Button("Hello World") {
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .rotation3DEffect(.degrees(45), axis: (x: 1.0, y: 0.0, z: 0.0))
            .padding(30)
            
            
            Button("Hello World") {
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .rotation3DEffect(.degrees(45), axis: (x: 0.0, y: 1.0, z: 0.0))
            
            
            Button("Hello World") {
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .rotation3DEffect(.degrees(45), axis: (x: 0.0, y: 0.0, z: 1.0))
            .padding(.top, 50)
        }
    }
}

struct RotationEffectExample_Previews: PreviewProvider {
    static var previews: some View {
        RotationEffectExample()
    }
}
