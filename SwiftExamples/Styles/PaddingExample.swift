import SwiftUI

struct PaddingExample: View {
    
    var GrayRectangle: some View { Rectangle().fill(.gray)
        .frame(width: 100, height: 30)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            GrayRectangle
                .padding()
                .border(.red, width: 3)
            
            GrayRectangle
                .padding(15)
                .border(.green, width: 3)
            
            GrayRectangle
                .padding(.vertical)
                .border(.blue, width: 2)
            
            GrayRectangle
                .padding(.horizontal)
                .border(.red, width: 3)
            
            GrayRectangle
                .padding(.leading)
                .border(.green, width: 3)
            
            GrayRectangle
                .padding(.trailing, 20)
                .border(.blue, width: 3)
            
            GrayRectangle
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 20, trailing: 50))
                .border(.red, width: 3)
            
            Spacer()
        }
    }
}

struct PaddingExample_Previews: PreviewProvider {
    static var previews: some View {
        PaddingExample()
    }
}
