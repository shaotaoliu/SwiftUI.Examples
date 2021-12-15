import SwiftUI

struct GroupAnyViewExample: View {
    @State var whichOne = 0
    
    var body: some View {
        VStack(spacing: 50) {
            Button("Next") {
                whichOne = (whichOne + 1) % 3
            }
            .font(.title)
            
            SubView1
            
            SubView2
        }
    }
    
    var SubView1: some View {
        Group {
            switch whichOne {
            case 0:
                Text("Hello World")
                    .font(.title)
                    .frame(width: 200, height: 200)
                
            case 1:
                Image("rainer")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipped()
                
            default:
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
            }
        }
    }
    
    var SubView2: some View {
        switch whichOne {
        case 0:
            return AnyView(Text("Hello World")
                            .font(.title)
                            .frame(width: 200, height: 200))
            
        case 1:
            return AnyView(Image("rainer")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipped())
            
        default:
            return AnyView(Circle()
                            .fill(.green)
                            .frame(width: 200, height: 200))
        }
    }
}

struct GroupAnyViewExample_Previews: PreviewProvider {
    static var previews: some View {
        GroupAnyViewExample()
    }
}
