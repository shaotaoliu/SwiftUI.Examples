import SwiftUI

struct UIScreenExample: View {
    var body: some View {
        VStack(spacing: 0) {
            
            Color.blue
                .frame(width: .infinity, height: UIScreen.main.bounds.height / 6)
            
            Color.purple
                .frame(width: .infinity, height: UIScreen.main.bounds.height / 6)
            
            Color.yellow
                .frame(width: .infinity, height: UIScreen.main.bounds.height / 6)
            
            Color.green
                .frame(width: .infinity, height: UIScreen.main.bounds.height / 4)
            
            Color.red
                .frame(width: .infinity, height: UIScreen.main.bounds.height / 4)
            
        }
        .ignoresSafeArea()
    }
}

struct UIScreenExample_Previews: PreviewProvider {
    static var previews: some View {
        UIScreenExample()
    }
}
