import Foundation
import WatchConnectivity

final class WatchBridge: NSObject, ObservableObject, WCSessionDelegate {
    static let shared = WatchBridge()
    @Published private(set) var lastError: String?
    private override init() { super.init(); guard WCSession.isSupported() else { return }; WCSession.default.delegate = self; WCSession.default.activate() }
    func send(_ item: NotificationEnvelope) {
        guard WCSession.default.isPaired else { return }
        do { let data = try JSONEncoder().encode(item); let object = try JSONSerialization.jsonObject(with: data) as! [String: Any]; WCSession.default.sendMessage(object, replyHandler: nil) { [weak self] error in self?.lastError = error.localizedDescription }; WCSession.default.transferUserInfo(object) }
        catch { lastError = error.localizedDescription }
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { lastError = error?.localizedDescription }
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) { session.activate() }
    #endif
}

