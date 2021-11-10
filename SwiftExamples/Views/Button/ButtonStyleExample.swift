import SwiftUI

struct ButtonStyleExample: View {
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Save") {
                showAlert = true
            }
            .buttonStyle(FancyButton())
            
            
            Button("Submit") {
                showAlert = true
            }
            .buttonStyle(FancyButton(foregroundColor: .red, backgroundColor: .yellow))
            
            
            Button(action: {
                showAlert = true
            }, label: {
                Label("Cancel", systemImage: "xmark")
            })
                .buttonStyle(FancyButton(foregroundColor: .yellow, backgroundColor: .red))
            
            
            Button(action: {
                showAlert = true
            }, label: {
                Label("Delete", systemImage: "trash")
            })
                .buttonStyle(FancyButton(foregroundColor: .black, backgroundColor: .green))
            
            Spacer()
        }
        .padding(.top, 50)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success"), message: Text("Data is saved successfully"))
        })
    }
    
    struct FancyButton: ButtonStyle {
        var foregroundColor: Color = .white
        var backgroundColor: Color = .blue
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(radius: 10)
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
}

struct ButtonStyleExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleExample()
    }
}
