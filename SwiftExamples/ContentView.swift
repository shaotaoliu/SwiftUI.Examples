import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "ChalkboardSE-Bold", size: 25)!]
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ExampleSection(headerText: "Views") {
                        ExampleLink(destination: TabViewExample())
                        ExampleLink(destination: TextFieldExample())
                        ExampleLink(destination: ButtonSimpleExample())
                        ExampleLink(destination: PickerExample())
                        ExampleLink(destination: ScrollViewExample())
                        ExampleLink(destination: LazyGridExample())
                        ExampleLink(destination: MenuExample())
                        ExampleLink(destination: ScrollViewReaderExample())
                    }
                    
                    ExampleSection(headerText: "Styles") {
                        ExampleLink(destination: PaddingExample())
                        ExampleLink(destination: ColorExample())
                        ExampleLink(destination: FrameExample())
                        ExampleLink(destination: FontExample())
                    }
                    
                    ExampleSection(headerText: "Modidfiers") {
                        ExampleLink(destination: OnDeleteExample())
                        ExampleLink(destination: FocusedExample())
                        ExampleLink(destination: OnChangeExample())
                        ExampleLink(destination: ConfirmationExample())
                    }
                    
                    ExampleSection(headerText: "States") {
                        ExampleLink(destination: StateObjectExample())
                        ExampleLink(destination: EnvironmentObjectExample())
                        ExampleLink(destination: EnvironmentExample())
                        ExampleLink(destination: StateExample())
                        ExampleLink(destination: ViewBuilderExample())
                    }
                    
                    ExampleSection(headerText: "Animation") {
                        ExampleLink(destination: AnimationExample1())
                        ExampleLink(destination: AnimationExample2())
                        ExampleLink(destination: AnimationExample3())
                        ExampleLink(destination: AnimationExample4())
                    }
                    
                    ExampleSection(headerText: "Gestures") {
                        ExampleLink(destination: TapGestureExample())
                        ExampleLink(destination: LongPressGestureExample())
                        ExampleLink(destination: DragGestureExample())
                        ExampleLink(destination: RotationGestureExample())
                        ExampleLink(destination: MagnificationGestureExample())
                    }
                    
                    ExampleSection(headerText: "Misc") {
                        ExampleLink(destination: GeometryReaderExample())
                        ExampleLink(destination: TimerExample())
                        ExampleLink(destination: MusicPlayerExample())
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
                Text(String("\(Destination.self)"))
            }
        }
    }
    
    struct ExampleSection<Content: View>: View {
        let headerText: String
        @ViewBuilder let content: () -> Content
        
        var body: some View {
            Section(header: Text(headerText).bold().font(.title2), content: {
                content()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
