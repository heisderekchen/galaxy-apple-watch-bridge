plugins { id("com.android.application"); kotlin("android") }

android { namespace = "com.galaxybridge.android"; compileSdk = 35
    defaultConfig { applicationId = "com.galaxybridge.android"; minSdk = 26; targetSdk = 35; versionCode = 1; versionName = "0.1.0" }
}
dependencies { implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.9.0") }

