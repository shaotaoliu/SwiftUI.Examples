import SwiftUI

struct OptionalBindingExample: View {
    
    @State private var name: String?
    @State private var value: String?
    
    var body: some View {
        VStack {
            TextField("Name", text: $name.bound)
                .textFieldStyle(.roundedBorder)
            
            TextField("Value", text: $value ?? "Hello")
                .textFieldStyle(.roundedBorder)
            
            Text(name ?? "Empty")
            Text(value ?? "Empty")
        }
        .padding()
    }
}

struct OptionalBindingExample_Previews: PreviewProvider {
    static var previews: some View {
        OptionalBindingExample()
    }
}

extension Optional where Wrapped == String {
    
    var bound: String {
        get {
            return self ?? ""
        }
        set {
            self = newValue.isEmpty ? nil : newValue
        }
    }
}

extension Binding {
    
    static func ?? (lhs: Binding<Optional<Value>>, rhs: Value) -> Binding<Value> {
        
        return Binding(get: {
            lhs.wrappedValue ?? rhs
        }, set: {
            lhs.wrappedValue = $0
        })
    }
}
