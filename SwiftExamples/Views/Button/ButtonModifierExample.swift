import SwiftUI

struct ButtonModifierExample: View {
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Save") {
                showAlert = true
            }
            .funcyStyle()
            
            
            Button("Submit") {
                showAlert = true
            }
            .funcyStyle()

            
            Button(action: {
                showAlert = true
            }, label: {
                Label("Cancel", systemImage: "xmark")
            })
                .funcyStyle()

            
            Button(action: {
                showAlert = true
            }, label: {
                Label("Delete", systemImage: "trash")
            })
                .funcyStyle()
            
            
            Spacer()
        }
        .padding(.top, 50)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success"), message: Text("Data is saved successfully"))
        })
    }
    
    struct FancyButton: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

extension View {
    func funcyStyle() -> some View {
        modifier(ButtonModifierExample.FancyButton())
    }
}

struct ButtonModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonModifierExample()
    }
}
