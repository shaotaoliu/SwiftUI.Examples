import SwiftUI

struct TabViewExample: View {
    
    enum Tabs: Int {
        case TapGestureExample
        case LongPressGestureExample
        case DragGestureExample
    }
    
    @State private var selectedTab = Tabs.TapGestureExample
    
    var body: some View {
        VStack {
            Text("Selected: ")
                .foregroundColor(.blue) +
            Text("\(selectedTab.rawValue)")
                .foregroundColor(.red)
            
            TabView(selection: $selectedTab) {
                TapGestureExample()
                    .tabItem {
                        Label("Tap", systemImage: "heart")
                    }
                    .tag(Tabs.TapGestureExample)
                
                LongPressGestureExample()
                    .tabItem {
                        Label("Long Press", systemImage: "star")
                    }
                    .tag(Tabs.LongPressGestureExample)
                
                DragGestureExample()
                    .tabItem {
                        Label("Drag", systemImage: "flag")
                    }
                    .tag(Tabs.DragGestureExample)
            }
        }
    }
}

struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
