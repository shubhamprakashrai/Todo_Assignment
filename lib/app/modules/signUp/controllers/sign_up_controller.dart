import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/modules/signUp/repository/sign_up_auth_repository.dart';
import 'package:todo_assignment/app/utils/custom_snackbar.dart';


class SignUpController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var emailError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = Rx<String?>(null);
  var isLoading = false.obs;

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      emailError.value = "Enter a valid email";
      return;
    } else {
      emailError.value = "";
    }

    if (password.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
      return;
    } else {
      passwordError.value = "";
    }

    if (password != confirmPassword) {
      confirmPasswordError.value = "Passwords do not match";
      return;
    } else {
      confirmPasswordError.value = null;
    }

    isLoading.value = true;


    final userCredential = await _authRepository.signUpWithEmail(email, password);

    isLoading.value = false;

    if (userCredential != null) {
       showCustomSnackBar(title: "Success", message: "Account created successfully!",isError: false,);
      Get.offNamed("/home"); 
    } else {
        showCustomSnackBar(title: "Error",message: "Failed to sign up. Try again.", isError: true,);
     
    }
  }
}
