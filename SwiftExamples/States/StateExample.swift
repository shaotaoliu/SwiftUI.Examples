import SwiftUI

struct StateExample: View {
    @State var name = "Hello"

    var body: some View {
        VStack {
            TextFieldView(label: "Name", name: $name)
                .padding()
            
            Divider()
            SubView(bindingName: $name, stateName: name)
                .padding()
        }
        .padding()
    }
}

fileprivate struct SubView: View {
    @Binding var bindingName: String
    @State var stateName: String
    @State private var secondName: String

    init(bindingName: Binding<String>, stateName: String) {
        self._bindingName = bindingName
        self.stateName = stateName
        self.secondName = bindingName.wrappedValue
    }
    
    var body: some View {
        VStack(spacing: 20) {
            TextFieldView(label: "Binding Name", name: $bindingName)
            TextFieldView(label: "State Name", name: $stateName)
            TextFieldView(label: "Second Name", name: $secondName)
        }
    }
}

fileprivate struct TextFieldView: View {
    var label: String
    @Binding var name: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .frame(width: 130, alignment: .leading)
            
            TextField(label, text: $name)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct StateExample_Previews: PreviewProvider {
    static var previews: some View {
        StateExample()
    }
}
