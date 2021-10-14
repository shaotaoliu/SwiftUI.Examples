import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timer = TimerExample()
    
    var body: some View {

        VStack {
            Text("\(timer.counter)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Circle()
                                .fill(.blue)
                                .frame(width: 300)
                            .shadow(radius: 20))
            
            Button("Start") {
                timer.Start()
            }
            .padding(.top, 30)
        }
        
    }
}

class TimerExample: ObservableObject {
    @Published var counter = 0
    
    func Start() {
        counter = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if (self.counter > 5) {
                timer.invalidate()
            }
            
            self.counter += 1
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
