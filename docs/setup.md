# Setup

## Android

1. Open `android-bridge` in Android Studio.
2. Set `NTFY_TOPIC_URL` in `app/src/main/java/.../BridgeConfig.kt` or replace it with a build-time secret.
3. Install on the Samsung phone.
4. Enable the app under Settings → Notifications → Notification access.

## iPhone and Watch

Create an Xcode project containing the files in `ios-watch-prototype/Sources`, with an iPhone app target and a WatchKit extension target. Enable the WatchConnectivity capability for both targets. Set the same ntfy URL in the iPhone app's settings before running.

