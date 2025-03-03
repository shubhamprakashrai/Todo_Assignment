import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_assignment/app/modules/homePage/bindings/home_page_binding.dart';
import 'package:todo_assignment/app/modules/signin/models/user_model.dart';
import 'package:todo_assignment/app/modules/signin/repositry/sign_authRepository.dart';
import 'package:todo_assignment/app/utils/custom_snackbar.dart';
import '../../homePage/views/home_page_view.dart';

class SigninController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordNotifier = ValueNotifier(false);
  var isLoading = false.obs;

  // ++++++++++++++++++++++++++++++++ Login Function +++++++++++++++++++++++++++++++++

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showCustomSnackBar(title: "Error",
      message: "Email and Password cannot be empty",
      isError: true,
    );
      return;
    }
    try {
      isLoading.value = true;
      UserModel? user = await _authRepository.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        showCustomSnackBar(
        title: "Success",
        message: "Login successful!",
        isError: false,
      );
        Get.offAll(() => const HomePageView(), binding: HomePageBinding());
      }
    } catch (e) {
      showCustomSnackBar(
        title: "Login Failed",
        message: e.toString(),
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
