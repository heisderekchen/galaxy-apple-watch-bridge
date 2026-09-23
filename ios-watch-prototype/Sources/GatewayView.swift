import SwiftUI

struct GatewayView: View {
    @StateObject private var gateway = IPhoneGateway(topicURL: URL(string: "https://ntfy.sh/replace-with-private-topic/json")!)
    var body: some View { VStack(spacing: 12) { Text("Galaxy Bridge").font(.title2); Text(gateway.latest?.title ?? "Waiting for Android notifications…"); Text(gateway.latest?.body ?? "").foregroundStyle(.secondary) }.padding().onAppear { gateway.start() }.onDisappear { gateway.stop() } }
}

