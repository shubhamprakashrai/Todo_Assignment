import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/modules/signUp/repository/sign_up_auth_repository.dart';


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

    // Input Validations
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

    // Call the repository to sign up
    final userCredential = await _authRepository.signUpWithEmail(email, password);

    isLoading.value = false;

    if (userCredential != null) {
      Get.snackbar("Success", "Account created successfully!");
      Get.offNamed("/home"); // Navigate to Home page
    } else {
      Get.snackbar("Error", "Failed to sign up. Try again.");
    }
  }
}
