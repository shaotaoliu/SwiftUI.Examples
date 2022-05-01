import SwiftUI

struct NavigationLinkExample: View {
    @State var gotoGeometryReaderExample = false
    @State var viewName: String? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink("", destination: GeometryReaderExample(), isActive: $gotoGeometryReaderExample)
                
                NavigationLink(destination: TimerExample(), tag: "TimerExample", selection: $viewName) {
                    EmptyView()
                }
                
                NavigationLink(destination: MusicPlayerExample(), tag: "MusicPlayerExample", selection: $viewName) {
                    EmptyView()
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
                
                NavigationLink(destination: {
                    ListExample()
                }, label: {
                    Text("\(Image(systemName: "list.bullet")) ListExample")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .cornerRadius(3)
                })
                
                Spacer()
            }
        }
    }
}

struct NavigationLinkExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkExample()
    }
}
