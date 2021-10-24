import SwiftUI

struct FontExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("SwiftUI Examples 1")
                .font(.largeTitle)
            
            Text("SwiftUI Examples 2")
                .font(.title)
            
            Text("SwiftUI Examples 3")
                .font(.title2)
            
            Text("SwiftUI Examples 4")
                .font(.title3)
            
            Text("SwiftUI Examples 5")
                .font(.caption)
            
            Text("SwiftUI Examples 6")
                .font(.caption2)
            
            Text("SwiftUI Examples 7")
                .font(.system(size: 30))
            
            Text("SwiftUI Examples 8")
                .font(.headline)
            
            Text("SwiftUI Examples 9")
                .font(.subheadline)
            
            Spacer()
        }
    }
}

struct FontExample_Previews: PreviewProvider {
    static var previews: some View {
        FontExample()
    }
}
