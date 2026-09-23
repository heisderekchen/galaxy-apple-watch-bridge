# Architecture

## Notification envelope

Android publishes a compact JSON envelope to ntfy:

```json
{
  "id": "stable-event-id",
  "packageName": "com.example.app",
  "appName": "Example",
  "title": "Message title",
  "body": "Message body",
  "receivedAt": "2026-09-23T00:00:00Z"
}
```

The iPhone polls ntfy's JSON stream, decodes the envelope, and transfers it to the Watch with `WCSession.sendMessage` when reachable. The Watch extension also receives background application context for eventual offline handling.

## Security and product limits

- Use an unguessable private topic and HTTPS.
- The prototype has no authentication, encryption, deduplication store, or durable queue.
- Android notification access is powerful and must be explicitly granted by the user.
- Apple Watch delivery depends on WatchConnectivity reachability and watch pairing.

