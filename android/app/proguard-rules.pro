# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Crashlytics
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-keep class com.google.firebase.crashlytics.** { *; }

# Hive
-keep class com.example.flutter_ui_playground.** { *; }
-keepattributes *Annotation*

# Flutter Secure Storage
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# Kotlin
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**

# OkHttp
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

# Gson
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }

# ← tambahkan ini untuk fix Missing Play Core classes
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# General
-keepattributes LineNumberTable,SourceFile
-renamesourcefileattribute SourceFile