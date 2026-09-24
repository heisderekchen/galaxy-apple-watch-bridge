import Foundation
import WatchConnectivity

final class WatchExtensionBridge: NSObject, WCSessionDelegate, ObservableObject {
    @Published var latest: NotificationEnvelope?
    override init() { super.init(); guard WCSession.isSupported() else { return }; WCSession.default.delegate = self; WCSession.default.activate() }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) { receive(message) }
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) { receive(userInfo) }
    private func receive(_ object: [String: Any]) { guard let data = try? JSONSerialization.data(withJSONObject: object), let item = try? JSONDecoder().decode(NotificationEnvelope.self, from: data) else { return }; DispatchQueue.main.async { self.latest = item } }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) { session.activate() }
    #endif
}
