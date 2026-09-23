# Galaxy Apple Watch Bridge

An experimental bridge for forwarding Samsung/Android notifications to an iPhone and then to Apple Watch.

## V1 pipeline

```text
Samsung notification
  -> Android NotificationListenerService
  -> ntfy topic (HTTPS JSON publish)
  -> iPhone Gateway (URLSession polling prototype)
  -> WatchConnectivity
  -> Apple Watch notification UI
```

This repository is an early, runnable prototype. It deliberately uses ntfy as a simple transport while the iPhone and Watch targets are validated. Do not publish sensitive notification contents to a public ntfy topic.

## Layout

- `android-bridge/` — Android service and ntfy client.
- `ios-watch-prototype/` — SwiftUI iPhone gateway and WatchConnectivity prototype.
- `docs/` — setup, protocol, and limitations.

## Quick start

1. Create a private ntfy topic and put its URL in the Android app configuration.
2. Open `android-bridge` in Android Studio, grant notification access, and enable the bridge.
3. Open `ios-watch-prototype` as an Xcode project/workspace, set the App Group if needed, and run the iPhone and Watch targets on paired devices/simulators.
4. Configure the same ntfy topic in the iPhone prototype.

See [docs/architecture.md](docs/architecture.md) and [docs/setup.md](docs/setup.md).

