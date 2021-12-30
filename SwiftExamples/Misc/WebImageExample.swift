import SwiftUI
import SDWebImageSwiftUI

struct WebImageExample: View {
    private let imageUrl = "https://www.google.com/logos/doodles/2021/seasonal-holidays-2021-6753651837109324-6752733080595603-cst.gif"
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: imageUrl)!)
                .resizable()
                .placeholder {
                    Image(systemName: "hourglass")
                }
                .scaledToFit()
                .frame(maxWidth: .infinity)
            
            Spacer()
        }
    }
}

struct WebImageExample_Previews: PreviewProvider {
    static var previews: some View {
        WebImageExample()
    }
}
