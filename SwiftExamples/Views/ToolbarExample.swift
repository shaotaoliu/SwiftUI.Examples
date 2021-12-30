import SwiftUI

struct ToolbarExample: View {
    @State private var name = ""
    @FocusState var isInputActive: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .focused($isInputActive)
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isInputActive = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Setting") {
                        
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button("How are you") {
                        
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Add") {
                        
                    }
                    
                    Button("Remove") {
                        
                    }
                }
            }
        }
    }
}

struct ToolbarExample_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarExample()
    }
}
