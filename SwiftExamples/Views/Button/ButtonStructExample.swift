import SwiftUI

struct ButtonStructExample: View {
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            FancyButton("Save") {
                showAlert = true
            }
            
            FancyButton("Submit") {
                showAlert = true
            }
            
            FancyButton("Cancel", systemImage: "xmark") {
                showAlert = true
            }
            
            FancyButton("Delete", systemImage: "trash") {
                showAlert = true
            }
            
            Spacer()
        }
        .padding(.top, 50)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success"), message: Text("Data is saved successfully"))
        })
    }
    
    struct FancyButton: View {
        let text: String
        let systemImage: String?
        let action: () -> Void
        
        init(_ text: String, systemImage: String? = nil, action: @escaping () -> Void) {
            self.text = text
            self.systemImage = systemImage
            self.action = action
        }
        
        var body: some View {
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
}

struct ButtonStructExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStructExample()
    }
}
