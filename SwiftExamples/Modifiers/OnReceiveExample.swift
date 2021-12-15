import SwiftUI

struct OnReceiveExample: View {
    @State var currentDate = Date()
    @State var timeRemaining = 30
    @State var stockPrice: Double = Double.random(in: 10...100)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let formatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    let now = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(formatter.string(from: currentDate))
                .onReceive(timer) {
                    currentDate = $0
                }
            
            Text("\(Int(currentDate.timeIntervalSince(now)))")
                .onReceive(timer) {
                    currentDate = $0
                }
            
            Text("\(timeRemaining)")
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
        
            Text(String.init(format: "Stock Price: $%.2f", stockPrice))
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            stockPrice = Double.random(in: 10...100)
        }
    }
}

struct OnReceiveExample_Previews: PreviewProvider {
    static var previews: some View {
        OnReceiveExample()
    }
}
