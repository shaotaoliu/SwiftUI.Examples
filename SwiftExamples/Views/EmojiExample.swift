import SwiftUI

struct EmojiExample: View {
    
    let emojis = "ππ»β οΈπ½πππΆπ¦πΉππ§πππππππ±π»πΊπΈ"
    
    var body: some View {
        ScrollView {
            Text(emojis)
                .font(.system(size: 160))
                .padding()
        }
    }
}

struct EmojiExample_Previews: PreviewProvider {
    static var previews: some View {
        EmojiExample()
    }
}
