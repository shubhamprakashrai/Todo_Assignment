import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo_assignment/app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    title: "GiphyApp",
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
