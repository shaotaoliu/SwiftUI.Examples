import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Safe Area Example")
                    .font(.title)
                
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding()
                }
            }
        }
        .background(Color.gray)
    }
}

struct ScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
