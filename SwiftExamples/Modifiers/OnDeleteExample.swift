import SwiftUI

struct OnDeleteExample: View {
    
    @State private var countries = [
        "Argentina",
        "Australia",
        "Brazil",
        "Canada",
        "France",
        "Germany",
        "India",
        "Japan"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    Text(country)
                }
                .onDelete(perform: deleteCountry)
            }
            .navigationTitle("Countries")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteCountry(offsets: IndexSet) {
        countries.remove(atOffsets: offsets)
    }
}

struct OnDeleteExample_Previews: PreviewProvider {
    static var previews: some View {
        OnDeleteExample()
    }
}
