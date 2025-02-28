import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';
import 'package:todo_assignment/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    title: "GiphyApp",
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
