import SwiftUI

struct ButtonFunctionExample: View {
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Save") {
                showAlert = true
            }
            .withFancyStyle()
            
            
            Button("Submit") {
                showAlert = true
            }
            .withFancyStyle()
            
            
            Button(action: {
                showAlert = true
            }, label: {
                Label("Cancel", systemImage: "xmark")
            })
                .withFancyStyle()

            
            Button(action: {
                showAlert = true
            }, label: {
                Label("Delete", systemImage: "trash")
            })
                .withFancyStyle()
            
            Spacer()
        }
        .padding(.top, 50)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success"), message: Text("Data is saved successfully"))
        })
    }
    

}

extension Button {
    func withFancyStyle() -> some View {
        self
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct ButtonFunctionExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFunctionExample()
    }
}
