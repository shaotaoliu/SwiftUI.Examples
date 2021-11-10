import SwiftUI

struct EnvironmentObjectExample: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack {
            Text(store.name)
                .font(.title)
            
            List {
                ForEach(store.items, id: \.id) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.description)
                    }
                }
            }
        }
    }
}

struct EnvironmentObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectExample()
            .environmentObject(Store())
    }
}
