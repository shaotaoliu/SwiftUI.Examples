import SwiftUI

struct UserDefaultsExample: View {
    enum Tabs: Identifiable {
        case appStorage
        case fetch
        case fetchAsOne
        
        var id: UUID {
            return UUID()
        }
    }
    
    @State private var model = UserDefaultsService.shared.fetch()
    @State private var showSheet: Tabs? = nil
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $model.name)
                
                TextField("", value: $model.count, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                
                Toggle("Expired", isOn: $model.expired)
            }
            
            HStack(spacing: 30) {
                Button("Save") {
                    UserDefaultsService.shared.save(model: model)
                    UserDefaultsService.shared.saveAsOne(model: model)
                }
                
                Button("AppStorage") {
                    showSheet = .appStorage
                }
                
                Button("Fetch") {
                    showSheet = .fetch
                }
                
                Button("FetchAsOne") {
                    showSheet = .fetchAsOne
                }
            }
            .sheet(item: $showSheet, content: { sheet in
                switch sheet {
                case .appStorage:
                    SubView1()
                    
                case .fetch:
                    SubView2()
                    
                case .fetchAsOne:
                    SubView3()
                }
            })
        }
    }
    
    struct SubView1: View {
        @AppStorage("UserDefaultsExample.name") var name: String = ""
        @AppStorage("UserDefaultsExample.count") var count: Int = 0
        @AppStorage("UserDefaultsExample.expired") var expired: Bool = false
        
        var body: some View {
            SubViewBody(name: name, count: count, expired: expired)
        }
    }
    
    struct SubView2: View {
        @State private var model = UserDefaultsService.shared.fetch()
        
        var body: some View {
            SubViewBody(name: model.name, count: model.count, expired: model.expired)
        }
    }
    
    struct SubView3: View {
        @State private var model = UserDefaultsService.shared.fetchAsOne()
        
        var body: some View {
            SubViewBody(name: model.name, count: model.count, expired: model.expired)
        }
    }
    
    struct SubViewBody: View {
        var name: String
        var count: Int
        @State var expired: Bool
        
        var body: some View {
            VStack {
                HStack {
                    Text("Name:").padding(.vertical)
                    Spacer()
                    Text("\(name)")
                }
                
                HStack {
                    Text("Count:")
                    Spacer()
                    Text("\(count)")
                }
                
                HStack {
                    Text("Expired:")
                    Spacer()
                    Toggle("", isOn: $expired)
                }
            }
            .padding()
        }
    }
}

struct UserDefaultsExample_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsExample()
    }
}
