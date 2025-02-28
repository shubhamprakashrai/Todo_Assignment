import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
  var isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
