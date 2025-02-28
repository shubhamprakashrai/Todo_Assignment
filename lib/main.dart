import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


import 'app/routes/app_pages.dart';
import 'app/utils/firebase_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Notifications
  Get.put(NotificationService());
  NotificationService notificationService = Get.find<NotificationService>();

  FirebaseMessaging.onBackgroundMessage(NotificationService.firebaseMessagingBackgroundHandler);

  await notificationService.initialize();
  await notificationService.getDeviceToken();
  await notificationService.firebaseInit();
  await notificationService.foregroundMessage();

  // Handle notifications when the app is opened from a terminated state
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      notificationService.handleTerminatedStateNotification(message);
    }
  });

  // Handle notifications when the app is opened from the background state
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    notificationService.handleBackgroundStateNotification(message);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GiphyApp",
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? Routes.SIGNIN
          : Routes.HOME_PAGE,
      getPages: AppPages.routes,
    );
  }
}
