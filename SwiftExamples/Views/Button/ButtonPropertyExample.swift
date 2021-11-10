import SwiftUI

struct ButtonPropertyExample: View {
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            SaveButton
            
            SubmitButton
            
            CancelButton
            
            DeleteButton
            
            Spacer()
        }
        .padding(.top, 50)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success"), message: Text("Data is saved successfully"))
        })
    }
    
    var SaveButton: some View {
        Button("Save") {
            showAlert = true
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(10)
    }
    
    var SubmitButton: some View {
        Button("Submit") {
            showAlert = true
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(10)
    }
    
    var CancelButton: some View {
        Button(action: {
            showAlert = true
        }, label: {
            Label("Cancel", systemImage: "xmark")
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
    
    var DeleteButton: some View {
        Button(action: {
            showAlert = true
        }, label: {
            Label("Delete", systemImage: "trash")
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct ButtonPropertyExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPropertyExample()
    }
}
