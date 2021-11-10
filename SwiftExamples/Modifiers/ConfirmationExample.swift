import SwiftUI

struct ConfirmationExample: View {
    @State var items = ["Apple", "Table", "Light", "Computer", "Food"]
    @State private var showConfirm = false
    @State var offsets: IndexSet?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: { offsets in
                    self.offsets = offsets
                    showConfirm = true
                })
            }
            .confirmationDialog("Confirm", isPresented: $showConfirm) {
                Button("Delete") {
                    items.remove(atOffsets: offsets!)
                }
            } message: {
                Text("Are you sure you want to delete?")
            }
            .listStyle(.plain)
            .navigationTitle("Items")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ConfirmationExample_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationExample()
    }
}
