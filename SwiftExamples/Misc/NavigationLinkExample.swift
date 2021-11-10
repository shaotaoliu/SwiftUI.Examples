import SwiftUI

struct NavigationLinkExample: View {
    @State var gotoGeometryReaderExample = false
    @State var viewName: String? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("", destination: GeometryReaderExample(), isActive: $gotoGeometryReaderExample)
                
                NavigationLink(destination: TimerExample(), tag: "TimerExample", selection: $viewName) {
                    Text("")
                }
                
                NavigationLink(destination: MusicPlayerExample(), tag: "MusicPlayerExample", selection: $viewName) {
                    Text("")
                }
                
                Button("GeometryReaderExample") {
                    gotoGeometryReaderExample = true
                }
                
                Button("TimerExample") {
                    viewName = "TimerExample"
                }
                
                Button("MusicPlayerExample") {
                    viewName = "MusicPlayerExample"
                }
            }
        }
    }
}

struct NavigationLinkExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkExample()
    }
}
