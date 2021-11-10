import SwiftUI

struct ButtonViewBuilderExample: View {
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            AddButton("Save") {
                showAlert = true
            }
            
            AddButton("Submit") {
                showAlert = true
            }
            
            AddButton("Cancel", systemImage: "xmark") {
                showAlert = true
            }
            
            AddButton("Delete", systemImage: "trash") {
                showAlert = true
            }
            
            Spacer()
        }
        .padding(.top, 50)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success"), message: Text("Data is saved successfully"))
        })
    }
    
    @ViewBuilder
    func AddButton(_ text: String, systemImage: String? = nil, action: @escaping () -> Void) -> some View {
        Group {
            if let image = systemImage {
                Button(action: action, label: {
                    Label(text, systemImage: image)
                })
            }
            else {
                Button(text, action: action)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct ButtonViewBuilderExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonViewBuilderExample()
    }
}
