import SwiftUI

struct PickerExample: View {
    var names = ["Kevin", "Chris", "Lucas", "Bruce", "Smith"]
    @State var selectedName = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Manager:")
                Picker("", selection: $selectedName, content: {
                    ForEach(names, id: \.self) { name in
                        Text(name)
                    }
                })
                    .labelsHidden()
            }
            
            Form {
                Picker("Manager:", selection: $selectedName, content: {
                    ForEach(names, id: \.self) { name in
                        Text(name)
                    }
                })
            }
            
            VStack {
                Picker("Manager", selection: $selectedName, content: {
                    ForEach(names, id: \.self) { name in
                        Text(name)
                    }
                })
                    .pickerStyle(.wheel)
            }
        }
        .padding()
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
