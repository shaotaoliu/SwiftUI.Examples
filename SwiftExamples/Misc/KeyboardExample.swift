import SwiftUI

struct KeyboardExample: View {
    @State var name = ""
    @FocusState var focused: Bool

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                .focused($focused)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Done") {
                            name = "Done"
                        }
                        
                        Button("Cancel") {
                            name = "Cancel"
                        }
                    }
                }
            
            Button("Submit") {
                focused = false
            }
            .padding()
            
            Button("Cancel") {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct KeyboardExample_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardExample()
    }
}
