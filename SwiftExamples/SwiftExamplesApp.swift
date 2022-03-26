import SwiftUI

@main
struct SwiftExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Store())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
