import SwiftUI

struct EmojiExample: View {
    
    let emojis = "😀👻☠️👽🎃👑🐶🦒🌹🌈🌧🍎🍇🍓🏀🏈🚗📱💻🇺🇸"
    
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
