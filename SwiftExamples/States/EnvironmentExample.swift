import SwiftUI

struct EnvironmentExample: View {
    @Environment(\.favoriteColor) var favoriteColor
    @State var showSubview = false
    
    var body: some View {
        Circle()
            .fill(favoriteColor)
            .frame(width: 150)
            .onTapGesture {
                showSubview = true
            }
            .sheet(isPresented: $showSubview) {
                EnvironmentSubView()
                    .environment(\.favoriteColor, .blue)
            }
    }
}

private struct FavoriteColor: EnvironmentKey {
    static let defaultValue: Color = .green
}

extension EnvironmentValues {
    var favoriteColor: Color {
        get {
            self[FavoriteColor.self]
        }
        set {
            self[FavoriteColor.self] = newValue
        }
    }
}

struct EnvironmentSubView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.favoriteColor) var favoriteColor
    
    var body: some View {
        Circle()
            .fill(favoriteColor)
            .frame(width: 150)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct EnvironmentExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentExample()
    }
}
