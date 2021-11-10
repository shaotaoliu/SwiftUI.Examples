import SwiftUI

struct TextFieldExample: View {
    var body: some View {
        TabView {
            TextFieldSimpleExample()
                .tabItem {
                    Image(systemName: "abc")
                    Text("Simple")
                }
            
            TextFieldKeyboardExample()
                .tabItem {
                    Image(systemName: "keyboard")
                    Text("Keyboard")
                }
        }
    }
}

struct TextFieldSimpleExample: View {
    @State var name = ""
    @State var editing = false
    @State var saved = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter Name", text: $name, onEditingChanged: { isEditing in
                editing = true
            }, onCommit: {
                saved = true
            })
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .alert(isPresented: $saved, content: {
                    Alert(title: Text("Message"), message: Text("Saved \(name)"))
                })
            
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
            
            Text("Editing: \(editing ? "Yes" : "No")")
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Name: \(name)")
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TextFieldKeyboardExample: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var age = ""
    @State private var score = ""
    @State private var emailAddress = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("First name", text: $firstName)
                .textContentType(.givenName)
                .submitLabel(.next)
            
            TextField("Last name", text: $lastName)
                .textContentType(.familyName)
                .submitLabel(.next)
            
            TextField("Phone number", text: $phoneNumber)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .submitLabel(.next)
            
            TextField("Email address", text: $emailAddress)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .submitLabel(.next)
            
            TextField("Age", text: $age)
                .keyboardType(.numberPad)
                .submitLabel(.next)
            
            TextField("Score", text: $score)
                .keyboardType(.decimalPad)
                .submitLabel(.go)
            
            Button("Submit") {
                print("Submitted")
                hideKeyboard()
            }
        }
        .padding()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}
