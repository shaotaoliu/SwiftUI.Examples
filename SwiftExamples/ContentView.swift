import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Gesture")
                            .bold()
                            .font(.title)) {
                    NavigationLink(destination: TapGestureView()) {
                        Text("TapGesture")
                    }
                    
                    NavigationLink(destination: LongPressGestureView()) {
                        Text("LongPressGesture")
                    }
                    
                    NavigationLink(destination: DragGestureView()) {
                        Text("DragGesture")
                    }
                    
                    NavigationLink(destination: DragGestureView2()) {
                        Text("DragGesture 2")
                    }
                    
                    NavigationLink(destination: RotationGestureView()) {
                        Text("RotationGesture")
                    }
                    
                    NavigationLink(destination: MagnificationGestureView()) {
                        Text("MagnificationGesture")
                    }
                }
                
                Section(header: Text("Other")
                            .bold()
                            .font(.title)) {
                    NavigationLink(destination: GeometryReaderView()) {
                        Text("GeometryReader")
                    }
                    
                    NavigationLink(destination: TimerView()) {
                        Text("Timer")
                    }
                    
                    NavigationLink(destination: OnDeleteView()) {
                        Text("OnDelete")
                    }
                    
                    NavigationLink(destination: TabViewView()) {
                        Text("TabView")
                    }
                    
                    NavigationLink(destination: FocusView()) {
                        Text("Focus")
                    }
                }
            }
            .navigationTitle("SwiftUI Examples")
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
