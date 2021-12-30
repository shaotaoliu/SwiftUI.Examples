import SwiftUI

struct TapStackExample: View {
    @State var tap1 = false
    @State var tap2 = false
    
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                Text("Hello World")
                    .font(.title)
                    .foregroundColor(tap1 ? .red : .black)
            }
            .frame(width: 300, height: 150)
            .border(.blue)
            .onTapGesture(perform: {
                tap1.toggle()
            })
            
            VStack {
                Text("Hello World")
                    .font(.title)
                    .foregroundColor(tap2 ? .red : .black)
            }
            .frame(width: 300, height: 150)
            .contentShape(Rectangle())
            .border(.blue)
            .onTapGesture(perform: {
                tap2.toggle()
            })
        }
    }
}

struct TapStackExample_Previews: PreviewProvider {
    static var previews: some View {
        TapStackExample()
    }
}
