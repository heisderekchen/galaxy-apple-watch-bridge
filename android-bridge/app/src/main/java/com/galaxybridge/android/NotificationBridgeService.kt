package com.galaxybridge.android

import android.app.Notification
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import kotlinx.coroutines.*
import org.json.JSONObject
import java.net.HttpURLConnection
import java.net.URL
import java.time.Instant
import java.util.UUID

class NotificationBridgeService : NotificationListenerService() {
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    override fun onNotificationPosted(sbn: StatusBarNotification) {
        val extras = sbn.notification.extras
        val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString().orEmpty()
        val body = extras.getCharSequence(Notification.EXTRA_TEXT)?.toString().orEmpty()
        if (title.isBlank() && body.isBlank()) return
        val payload = JSONObject().apply {
            put("id", "${sbn.packageName}:${sbn.postTime}:${UUID.randomUUID()}")
            put("packageName", sbn.packageName); put("appName", sbn.packageName)
            put("title", title); put("body", body); put("receivedAt", Instant.now().toString())
        }.toString()
        scope.launch { publish(payload) }
    }
    private fun publish(payload: String) {
        val conn = URL(BridgeConfig.NTFY_TOPIC_URL).openConnection() as HttpURLConnection
        try { conn.requestMethod = "POST"; conn.doOutput = true; conn.setRequestProperty("Content-Type", "application/json")
            conn.outputStream.use { it.write(payload.toByteArray()) }; conn.responseCode
        } finally { conn.disconnect() }
    }
    override fun onDestroy() { scope.cancel(); super.onDestroy() }
}

