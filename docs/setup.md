# Setup

## Android

1. Open `android-bridge` in Android Studio. The folder is a complete Gradle project; Android Studio can generate the local Gradle wrapper on first sync if needed.
2. Set `NTFY_TOPIC_URL` in `app/src/main/java/.../BridgeConfig.kt` or replace it with a build-time secret.
3. Install on the Samsung phone.
4. Enable the app under Settings → Notifications → Notification access.

## iPhone and Watch

Create an Xcode project containing the files in `ios-watch-prototype/Sources`, with an iPhone app target and a WatchKit extension target. Enable the WatchConnectivity capability for both targets. Set the same ntfy URL in the iPhone app's settings before running.

The iOS folder includes `project.yml` for XcodeGen. Run `xcodegen generate` from `ios-watch-prototype` on a Mac with Xcode installed; then open `GalaxyBridge.xcodeproj`.

Bundle identifiers, signing team, and WatchKit pairing remain device-specific. The target split is:

- iPhone app: `GatewayView.swift`, `IPhoneGateway.swift`, `NotificationEnvelope.swift`, `WatchBridge.swift`.
- Watch extension: `NotificationEnvelope.swift`, `WatchExtensionBridge.swift`.
