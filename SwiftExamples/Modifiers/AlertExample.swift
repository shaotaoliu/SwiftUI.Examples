import SwiftUI

struct AlertExample: View {
    @State var hasAlert = false
    @State fileprivate var myAlert: MyAlert?
    
    @State var saveFailed = false
    @State var updateFailed = false
    @State var deleteFailed = false
    
    var body: some View {
        VStack(spacing: 50) {
            Button("Save") {
                saveFailed = true
            }
            .alert("Save failed", isPresented: $saveFailed, actions: {})
            
            
            Button("Update") {
                updateFailed = true
            }
            .alert("Failed", isPresented: $updateFailed, actions: {
                Button("Hello") {}
            }, message: {
                Text("\nUpdate failed")
            })
            
            
            Button("Show Alert") {
                myAlert = MyAlert(code: 1001, message: "This is an alert")
                hasAlert = true
            }
            .alert("Alert", isPresented: $hasAlert, presenting: myAlert, actions: { alert in
                Button("Cancel") {}
                Button("OK") {}
            }, message: { alert in
                Text(alert.message)
            })
            
            
            Button("Delete") {
                deleteFailed = true
            }
            .alert("Delete failed", isPresented: $deleteFailed, actions: {
                Button("Hello", action: {})
                
                Button(action: {}, label: {
                    Text("OK")
                })
                
                Button("Confirm", role: .destructive, action: {})
                
                Button(role: .cancel, action: {}, label: {
                    Text("Cancel")
                })
            }, message: {
                Text("Do you like this?")
            })
        }
    }
}

fileprivate struct MyAlert {
    let code: Int
    let message: String
}

struct AlertExample_Previews: PreviewProvider {
    static var previews: some View {
        AlertExample()
    }
}
