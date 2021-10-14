import SwiftUI

struct TabViewView: View {
    
    enum Tabs: Int {
        case TapGestureView
        case LongPressGestureView
        case DragGestureView
    }
    
    @State private var selectedTab = Tabs.TapGestureView
    
    var body: some View {
        VStack {
            Text("Selected: ")
                .foregroundColor(.blue) +
            Text("\(selectedTab.rawValue)")
                .foregroundColor(.red)
            
            TabView(selection: $selectedTab) {
                TapGestureView()
                    .tabItem {
                        Label("Tap", systemImage: "heart")
                    }
                    .tag(Tabs.TapGestureView)
                
                LongPressGestureView()
                    .tabItem {
                        Label("Long Press", systemImage: "star")
                    }
                    .tag(Tabs.LongPressGestureView)
                
                DragGestureView()
                    .tabItem {
                        Label("Drag", systemImage: "flag")
                    }
                    .tag(Tabs.DragGestureView)
            }
        }
    }
}

struct TabViewView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewView()
    }
}
