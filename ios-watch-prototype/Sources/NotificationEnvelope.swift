import Foundation

struct NotificationEnvelope: Codable, Identifiable {
    let id: String; let packageName: String; let appName: String
    let title: String; let body: String; let receivedAt: String
}

