import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "ChalkboardSE-Bold", size: 25)!]
    }

    var body: some View {
        TabView {
            ExampleViews1()
                .tabItem {
                    Label("Part I", systemImage: "1.circle")
                }
            
            ExampleViews2()
                .tabItem {
                    Label("Part II", systemImage: "2.circle")
                }
        }
    }
    
    struct ExampleViews1: View {
        var body: some View {
            NavigationView {
                List {
                    ExampleSection(headerText: "Views") {
                        ExampleLink(destination: TabViewExample())
                        ExampleLink(destination: TextFieldExample1())
                        ExampleLink(destination: ButtonSimpleExample())
                        ExampleLink(destination: PickerExample())
                        ExampleLink(destination: ScrollViewExample())
                        ExampleLink(destination: LazyGridExample())
                        ExampleLink(destination: MenuExample())
                        ExampleLink(destination: ScrollViewReaderExample1())
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
                        ExampleLink(destination: OnReceiveExample())
                        ExampleLink(destination: ConfirmationExample())
                        ExampleLink(destination: AlertExample())
                    }
                    
                    ExampleSection(headerText: "States") {
                        ExampleLink(destination: StateObjectExample())
                        ExampleLink(destination: EnvironmentObjectExample())
                        ExampleLink(destination: EnvironmentExample())
                        ExampleLink(destination: StateExample())
                        ExampleLink(destination: ViewBuilderExample())
                    }
                }
                .navigationTitle("SwiftUI Examples")
            }
        }
    }
    
    struct ExampleViews2: View {
        var body: some View {
            NavigationView {
                List {
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
                        ExampleLink(destination: UserDefaultsExample())
                        ExampleLink(destination: KeyboardExample())
                    }
                }
                .navigationBarHidden(true)
            }
            
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
