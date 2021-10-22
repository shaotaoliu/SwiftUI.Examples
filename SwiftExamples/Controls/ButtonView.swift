import SwiftUI

struct ButtonView: View {
    
    @State var name = ""
    @State var editing = false
    @State var saved = false
    
    var body: some View {
        VStack {
            TextField("Enter Name", text: $name, onEditingChanged: { isEditing in
                editing = true
            }, onCommit: {
                saved = true
            })
                .textFieldStyle(.roundedBorder)
                .padding()
                .alert(isPresented: $saved, content: {
                    Alert(title: Text("Message"), message: Text("Saved"))
                })
            
            HStack {
                Button("Save") {
                    saved = true
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .disabled(name == "")
                .opacity(name == "" ? 0.6 : 1)
                
                Button("OK") {
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.blue))
            }
            
            HStack {
                Button(action: {
                    name = ""
                }, label: {
                    Label("Cancel", systemImage: "xmark")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        Image(systemName: "trash")
                        Text("Delete")
                    }
                })
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text("\(editing ? "" : "not ")editing")
                    .padding()
                
                Text(name)
            }
            
            Spacer()
        }
        .padding(.top, 50)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
