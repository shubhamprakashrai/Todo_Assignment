import 'dart:io';
import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService extends GetxController {
  RxInt notificationCount = 0.obs;
  String? token;

  /// 🔹 Request permission for notifications
  Future<void> initialize() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("✅ Notifications enabled");
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint("⚠️ Notifications enabled in provisional mode (iOS)");
    } else {
      debugPrint("❌ Notifications denied");
    }
  }

  /// 🔹 Get Firebase device token
  Future<String> getDeviceToken() async {
    token = await FirebaseMessaging.instance.getToken();
    if (token == null) {
      isTokenRefresh();
      throw Exception('Unable to get token.');
    } else {
      debugPrint("📲 Device token: $token");
      return token!;
    }
  }

  /// 🔹 Listen for token refresh
  void isTokenRefresh() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      debugPrint("🔄 Token refreshed: $newToken");
      token = newToken;
    });
  }

  /// 🔹 Initialize Firebase Messaging
  Future<void> firebaseInit() async {
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint("📩 Foreground Message: ${message.data}");
      if (Platform.isIOS) {
        foregroundMessage();
      }
      if (Platform.isAndroid) {
        initLocalNotification();
        showNotification(message);
      }
    });
  }

  /// 🔹 Initialize Awesome Notifications
  Future<void> initLocalNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'high_importance_channel',
          channelName: 'High Importance Notifications',
          channelDescription: 'Notifications with high importance',
          defaultColor: Colors.blue,
          ledColor: Colors.blue,
          importance: NotificationImportance.High,
          playSound: true,  // ✅ Enables sound
          enableLights: true,
          enableVibration: true, // ✅ Enables vibration
        ),
      ],
    );
  }

  /// 🔹 Show a local notification
  Future<void> showNotification(RemoteMessage message) async {
    String title = message.notification?.title ?? "No Title";
    String body = message.notification?.body ?? "No Body";
    Map<String, String?>? payloadData = Map<String, String?>.from(message.data);

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(1000),
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        color: Colors.blue,
        payload: payloadData,
      ),
    );
    AwesomeNotifications().setListeners(onActionReceivedMethod: onActionReceivedMethod);
    update();
  }

  /// 🔹 Handle notification click actions
  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint("🔔 Notification clicked: ${receivedAction.payload}");
  }

  /// 🔹 Handle background notifications manually
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    debugPrint("🌙 Background Message: ${message.notification?.title}");

    // Manually show notification in background
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(1000),
        channelKey: 'high_importance_channel',
        title: message.notification?.title ?? "No Title",
        body: message.notification?.body ?? "No Body",
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  /// 🔹 Handle foreground notifications on iOS
  Future<void> foregroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// 🔹 Handle when app is opened from a terminated state
  Future<void> handleTerminatedStateNotification(RemoteMessage message) async {
    debugPrint("🚀 Opened from terminated state: ${message.data}");
  }

  /// 🔹 Handle when app is opened from the background
  Future<void> handleBackgroundStateNotification(RemoteMessage message) async {
    debugPrint("🟢 Opened from background: ${message.data}");
  }
}
