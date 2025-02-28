import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';
import 'package:todo_assignment/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GiphyApp",
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? Routes.SIGNIN  // If user is NOT logged in, go to Login Screen
          : Routes.HOME_PAGE,    // If user is logged in, go to Home Screen
      getPages: AppPages.routes,
    );
  }
}
