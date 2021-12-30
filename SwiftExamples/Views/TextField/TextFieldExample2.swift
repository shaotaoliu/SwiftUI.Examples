import SwiftUI

struct TextFieldExample2: View {
    @State var username = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    var body: some View {
        VStack(spacing: 15) {
            CustomTextField1(placeholder: "User Name", text: $username)
            
            CustomTextField1(placeholder: "Email", text: $email)
            
            CustomTextField1(placeholder: "Phone Number", text: $phoneNumber)
        }
        .padding()
    }
}

struct CustomTextField1: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .foregroundColor(text.isEmpty ? Color(.placeholderText) : Color(.secondaryLabel))
                    .offset(y: text.isEmpty ? 0 : 35)
                    .scaleEffect(text.isEmpty ? 1 : 0.7, anchor: .leading)
                
                TextField("", text: $text).autocapitalization(.none)
                
            }
            .font(.title2)
            .padding(.bottom, text.isEmpty ? 0 : 18)
            .animation(.default, value: text)
            
            Divider()
        }
    }
}

struct TextFieldExample2_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample2()
    }
}
