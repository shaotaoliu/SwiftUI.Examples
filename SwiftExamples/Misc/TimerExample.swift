import SwiftUI

struct TimerExample: View {
    
    @StateObject private var timer = TimerExample()
    
    var body: some View {

        VStack(spacing: 30) {
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                timer.running.toggle()
            }, label: {
                Image(systemName: timer.running ? "pause.circle" : "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
            })
        }
        
    }
    
    private class TimerExample: ObservableObject {
        @Published var counter = 0
        @Published var running = false {
            didSet {
                if running {
                    run()
                }
            }
        }
        
        func run() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if (self.running) {
                    self.counter += 1
                }
                else {
                    timer.invalidate()
                }
            }
        }
    }
}


struct TimerExample_Previews: PreviewProvider {
    static var previews: some View {
        TimerExample()
    }
}
