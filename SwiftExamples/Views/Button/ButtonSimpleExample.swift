import SwiftUI

struct ButtonSimpleExample: View {
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button(".clipShape( )") {
                showAlert = true
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            
            Button("RoundedRectangle( )") {
                showAlert = true
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.red)
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.yellow))
            
            
            Button(".cornerRadius( )") {
                showAlert = true
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.yellow)
            .background(.red)
            .cornerRadius(10)
            
            
            Button(action: {
                showAlert = true
            }, label: {
                Label("Cancel", systemImage: "xmark")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                    .background(.green)
                    .cornerRadius(10)
            })


            Button(action: {
                showAlert = true
            }, label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
            })
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.orange)
            .background(.gray)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            Spacer()
        }
        .padding(.top, 50)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success"), message: Text("Data is saved successfully"))
        })
    }
}

struct ButtonSimpleExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSimpleExample()
    }
}
