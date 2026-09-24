import SwiftUI

@main struct WatchExtensionApp: App {
    @StateObject private var bridge = WatchExtensionBridge()
    var body: some Scene {
        WindowGroup {
            VStack(spacing: 8) {
                Text(bridge.latest?.appName ?? "Galaxy Bridge")
                Text(bridge.latest?.title ?? "Waiting for notifications…").font(.headline)
                Text(bridge.latest?.body ?? "").font(.caption)
            }.padding()
        }
    }
}

