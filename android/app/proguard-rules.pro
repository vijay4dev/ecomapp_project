# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.** { *; }

# Keep classes used by reflection
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
    @android.webkit.JavascriptInterface <fields>;
}

# Keep classes used by Gson
-keep class com.google.gson.** { *; }
-keep class com.google.gson.annotations.** { *; }

# Keep classes used by Retrofit
-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

# Keep Google Play Core classes
-keep class com.google.android.play.core.** { *; }
-keep interface com.google.android.play.core.** { *; }