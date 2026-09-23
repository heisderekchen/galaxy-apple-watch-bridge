import Foundation

@MainActor final class IPhoneGateway: ObservableObject {
    @Published private(set) var latest: NotificationEnvelope?
    private var task: Task<Void, Never>?
    let topicURL: URL
    init(topicURL: URL) { self.topicURL = topicURL }
    func start() { task = Task { for await line in URLSession.shared.bytes(from: topicURL).lines { guard !Task.isCancelled else { return }; if let data = line.data(using: .utf8), let item = try? JSONDecoder().decode(NotificationEnvelope.self, from: data) { latest = item; WatchBridge.shared.send(item) } } } }
    func stop() { task?.cancel() }
    deinit { task?.cancel() }
}

