import SwiftUI

struct TextFieldExample3: View {
    @State var username = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    var body: some View {
        VStack(spacing: 20) {
            CustomTextField2(placeholder: "User Name", text: $username)
            
            CustomTextField2(placeholder: "Email", text: $email)
            
            CustomTextField2(placeholder: "Phone Number", text: $phoneNumber)
        }
        .padding()
    }
}

struct CustomTextField2: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("", text: $text)
                
                if !text.isEmpty {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            .font(.title2)
            .background(
                Text(placeholder)
                    .font(.title2)
                    .padding(.horizontal, text.isEmpty ? 0 : 8)
                    .background(Color.white)
                    .scaleEffect(text.isEmpty ? 1 : 0.7, anchor: .leading)
                    .offset(y: text.isEmpty ? 0 : -27)
                    .foregroundColor(Color(.placeholderText))
                    .animation(.easeInOut.speed(1.5), value: text)
                , alignment: .leading
            )
            .padding(.horizontal)
        }
        .frame(height: 55)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.black, lineWidth: 1)
        )
    }
}

struct TextFieldExample3_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample3()
    }
}
