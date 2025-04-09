import SwiftUI
import SwiftData

@main
struct BlimApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Challenge.self, Task.self])
    }
}
