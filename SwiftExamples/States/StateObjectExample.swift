import SwiftUI

struct StateObjectExample: View {
    @StateObject var counter = Counter()
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("This is Main View")
                
                Button("Increment") {
                    counter.inc()
                }
                
                Text("\(counter.count)")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
            StateObjectSubView()
            ObservedObjectSubView()
        }
    }
    
    struct StateObjectSubView: View {
        @StateObject var counter = Counter()
        
        var body: some View {
            VStack {
                VStack(spacing: 10) {
                    Text("This is @StateObject SubView")
                    
                    Button("Increment") {
                        counter.inc()
                    }
                    
                    Text("\(counter.count)")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
        }
    }
    
    struct ObservedObjectSubView: View {
        @ObservedObject var counter = Counter()
        
        var body: some View {
            VStack {
                VStack(spacing: 10) {
                    Text("This is @ObservedObject SubView")
                    
                    Button("Increment") {
                        counter.inc()
                    }
                    
                    Text("\(counter.count)")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
        }
    }
}

struct StateObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectExample()
    }
}

class Counter: ObservableObject {
    @Published var count = 0
    
    func inc() {
        count += 1
    }
}
