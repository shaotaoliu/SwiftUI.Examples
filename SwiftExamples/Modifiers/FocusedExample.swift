import SwiftUI

struct FocusedExample: View {
    
    enum Field: Hashable {
        case username
        case password
    }
    
    @FocusState private var focusedField: Field?
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Username", text: $username)
                    .focused($focusedField, equals: .username)
                
                SecureField("Password", text: $password)
                    .focused($focusedField, equals: .password)
                
                Button("Login") {
                    if username.isEmpty {
                        focusedField = .username
                    }
                    else if password.isEmpty {
                        focusedField = .password
                    }
                    else {
                        login(username, password)
                    }
                }
            }
            .navigationTitle("Login")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    focusedField = .username
                }
            }
        }
    }
    
    func login(_ username: String, _ password: String) {
        print("You are logged in")
    }
}

struct FocusedExample_Previews: PreviewProvider {
    static var previews: some View {
        FocusedExample()
    }
}
