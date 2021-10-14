import SwiftUI

struct TapGestureView: View {
    
    @State private var tapped = false
    
    var body: some View {
        
        Text("Tap me!")
            .font(.largeTitle)
            .foregroundColor(tapped ? .black : .white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(tapped ? Color.blue : Color.green))
            .onTapGesture {
                tapped.toggle()
            }
        
    }
}

struct TapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureView()
    }
}
