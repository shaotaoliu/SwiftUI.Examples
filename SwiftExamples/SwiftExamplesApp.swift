import SwiftUI

@main
struct SwiftExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            WebImageExample()
                .environmentObject(Store())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
