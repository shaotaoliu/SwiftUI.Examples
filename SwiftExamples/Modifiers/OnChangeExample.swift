import SwiftUI

struct OnChangeExample: View {
    @State var name2 = ""
    @State var name3 = ""
    @State var name1 = "" {
        didSet {
            name2 = name1
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Name 1: ")
                TextField("Name1", text: $name1)
                    .textFieldStyle(.roundedBorder)
            }
            
            Text("Name 2: \(name2)")
            Text("Name 3: \(name3)")
        }
        .onChange(of: name1) { value in
            name3 = name1
        }
        .padding()
    }
}

struct OnChangeExample_Previews: PreviewProvider {
    static var previews: some View {
        OnChangeExample()
    }
}
