import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "ChalkboardSE-Bold", size: 25)!]
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Gestures").bold().font(.title2)) {
                        ExampleLink(destination: TapGestureView())
                        ExampleLink(destination: LongPressGestureView())
                        ExampleLink(destination: DragGestureView())
                        ExampleLink(destination: DragGestureView2())
                        ExampleLink(destination: RotationGestureView())
                        ExampleLink(destination: MagnificationGestureView())
                    }
                    
                    Section(header: Text("Controls").bold().font(.title2)) {
                        ExampleLink(destination: TabViewView())
                        ExampleLink(destination: ButtonView())
                        ExampleLink(destination: ScrollViewExample())
                    }
                    
                    Section(header: Text("Styles").bold().font(.title2)) {
                        ExampleLink(destination: PaddingExample())
                        ExampleLink(destination: ColorExample())
                        ExampleLink(destination: FrameExample())
                        ExampleLink(destination: FontExample())
                    }
                    
                    Section(header: Text("Modidfiers").bold().font(.title2)) {
                        ExampleLink(destination: OnDeleteView())
                        ExampleLink(destination: FocusView())
                    }
                    
                    Section(header: Text("Misc").bold().font(.title2)) {
                        ExampleLink(destination: GeometryReaderView())
                        ExampleLink(destination: TimerView())
                    }
                }
                .navigationTitle("SwiftUI Examples")
            }
            
            Spacer()
        }
        
    }
    
    struct ExampleLink<Destination: View>: View {
        let destination: Destination
        var body: some View {
            NavigationLink(destination: destination) {
                let name: String = "\(Destination.self)"
                Text(name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
