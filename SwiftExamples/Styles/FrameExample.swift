import SwiftUI

struct FrameExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HELLO")
                .background(Color.white)
                .frame(width: 120, height: 80, alignment: .center)
                .background(Color.red)
                .padding(.top)
            
            Text("HELLO")
                .background(Color.white)
                .frame(width: 120, height: 80, alignment: .leading)
                .background(Color.red)
            
            Text("HELLO")
                .background(Color.white)
                .frame(width: 120, height: 80, alignment: .topLeading)
                .background(Color.red)
            
            Text("HELLO")
                .background(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
                .background(Color.red)
            
            Text("HELLO")
                .frame(width: 70, height: 30)
                .background(Color.white)
                .frame(width: 100, height: 60)
                .background(Color.red)
                .frame(width: 130, height: 90)
                .background(Color.green)
                .frame(width: 160, height: 120)
                .background(Color.yellow)
                .frame(width: 190, height: 150)
                .background(Color.blue)
            
            Spacer()
        }
    }
}

struct FrameExample_Previews: PreviewProvider {
    static var previews: some View {
        FrameExample()
    }
}
