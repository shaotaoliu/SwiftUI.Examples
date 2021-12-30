import SwiftUI

struct AttributedStringExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(appleString())
            
            Text(linkString())
            
            Text(markdownString())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    func appleString() -> AttributedString {
        var attr = AttributedString("There are two apples on the table.\nApple is my favorite fruit.")
        
        if let range = attr.range(of: "Apple", options: .caseInsensitive) {
            attr[range].foregroundColor = .red
            attr[range].font = .body.bold()
        }
        
        return attr
    }
    
    func linkString() -> AttributedString {
        var attr = AttributedString("This is a string containing a link.")
        
        if let range = attr.range(of: "link") {
            attr[range].link = URL(string: "https://www.example.com")
        }
        
        return attr
    }
    
    func markdownString() -> AttributedString {
        do {
            return try AttributedString(markdown: "**Thank you!** Please visit our [website](https://www.example.com).")
        } catch {
            
            return AttributedString("Thank you! Please visit our website.")
        }
    }
}

struct AttributedStringExample_Previews: PreviewProvider {
    static var previews: some View {
        AttributedStringExample()
    }
}
