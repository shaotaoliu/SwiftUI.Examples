import SwiftUI

struct Focused2Example: View {
    enum Field {
        case firstName
        case lastName
        case emailAddress
    }
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            TextField("Enter your first name", text: $firstName)
                .textFieldStyle(.roundedBorder)
                .focused($focusedField, equals: .firstName)
                .textContentType(.givenName)
                .submitLabel(.next)
                .padding(.horizontal)
            
            TextField("Enter your last name", text: $lastName)
                .textFieldStyle(.roundedBorder)
                .focused($focusedField, equals: .lastName)
                .textContentType(.familyName)
                .submitLabel(.next)
                .padding()
            
            TextField("Enter your email address", text: $emailAddress)
                .textFieldStyle(.roundedBorder)
                .focused($focusedField, equals: .emailAddress)
                .textContentType(.emailAddress)
                .submitLabel(.join)
                .padding(.horizontal)
        }
        .onSubmit {
            switch focusedField {
            case .firstName:
                focusedField = .lastName
            case .lastName:
                focusedField = .emailAddress
            default:
                print("Creating account…")
            }
        }
    }
}

struct Focused2Example_Previews: PreviewProvider {
    static var previews: some View {
        Focused2Example()
    }
}
