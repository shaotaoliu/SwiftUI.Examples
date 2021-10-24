import SwiftUI

struct ColorExample: View {
    var body: some View {
        ZStack {
            Color(red: 0.8, green: 0.8, blue: 0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("HELLO WORLD 1").font(.title2)
                    .foregroundColor(.red)
                
                Text("HELLO WORLD 2").font(.title2)
                    .foregroundColor(Color.primary)
                
                Text("HELLO WORLD 3").font(.title2)
                    .foregroundColor(Color.primary.opacity(0.25))
                
                Text("HELLO WORLD 4").font(.title2)
                    .foregroundColor(Color.secondary)
                
                Text("HELLO WORLD 5").font(.title2)
                    .foregroundColor(Color(red: 1.0, green: 0.6, blue: 0.3, opacity: 0.5))
                
                Text("HELLO WORLD 6").font(.title2)
                    .foregroundColor(Color(.systemRed))
                
                Text("HELLO WORLD 7").font(.title2)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .background(Color.blue)
                
                Text("HELLO WORLD 8").font(.title2)
                    .foregroundColor(Color(UIColor.secondarySystemBackground))
                    .background(Color.blue)
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ColorExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorExample()
    }
}
