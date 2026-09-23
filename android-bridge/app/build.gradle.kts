plugins { id("com.android.application"); kotlin("android") }

android { namespace = "com.galaxybridge.android"; compileSdk = 35; buildToolsVersion = "35.0.0"
    defaultConfig { applicationId = "com.galaxybridge.android"; minSdk = 26; targetSdk = 35; versionCode = 1; versionName = "0.1.0" }
    compileOptions { sourceCompatibility = JavaVersion.VERSION_17; targetCompatibility = JavaVersion.VERSION_17 }
    kotlinOptions { jvmTarget = "17" }
}
dependencies { implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.9.0") }
