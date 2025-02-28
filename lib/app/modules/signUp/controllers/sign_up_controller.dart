import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var emailError = ''.obs;
  var passwordError = ''.obs;
  // var confirmPasswordError = ''.obs;
  var confirmPasswordError = Rx<String?>(null);

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
