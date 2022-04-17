import SwiftUI

struct LazyGridExample: View {
    let images = ["image1", "image2", "image3", "image4", "image5"]
    
    var body: some View {
        TabView {
            LazyGridView(orientation: .vertical, images: images, total: 50, count: 3)
                .tabItem {
                    Image(systemName: "square.split.2x1")
                    Text("LazyVGrid")
                }
            
            LazyGridView(orientation: .horizontal, images: images, total: 50, count: 9)
                .tabItem {
                    Image(systemName: "square.split.1x2")
                    Text("LazyHGrid")
                }
            
            SimpleLazyVGridExample()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("SimpleV")
                }
            
            SimpleLazyHGridExample()
                .tabItem {
                    Image(systemName: "square.grid.4x3.fill")
                    Text("SimpleH")
                }
        }
    }
}

struct LazyGridView: View {
    let orientation: Orientation
    let images: [String]
    let total: Int
    let count: Int
    
    var body: some View {
        ScrollView(orientation == .vertical ? .vertical : .horizontal) {
            LazyGrid(orientation: orientation, images: images, total: total, count: count) { images, total in
                ForEach(1...total, id: \.self) { _ in
                    Image(images[Int.random(in: 0..<images.count)])
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

struct LazyGrid<Content: View>: View {
    let orientation: Orientation
    let images: [String]
    let total: Int
    let count: Int
    @ViewBuilder let content: ([String], Int) -> Content
    
    var body: some View {
        switch orientation {
        case .vertical:
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: count)) {
                content(images, total)
            }
            
        case .horizontal:
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: count)) {
                content(images, total)
            }
        }
    }
}

struct LazyGridExample_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridExample()
    }
}


struct SimpleLazyVGridExample: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(1...100, id: \.self) { i in
                    Text("\(i)")
                        .padding()
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

struct SimpleLazyHGridExample: View {
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(1...100, id: \.self) { i in
                    Text("\(i)")
                        .padding()
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
