import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/modules/signUp/bindings/sign_up_binding.dart';
import 'package:todo_assignment/app/modules/signUp/views/sign_up_view.dart';
import 'package:todo_assignment/app/uiUtils/custom_btn.dart';
import 'package:todo_assignment/app/uiUtils/custom_textfiled.dart';
import 'package:todo_assignment/app/utils/app_colors.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 30,
                ),
                _header(context),
                const SizedBox(
                  height: 10,
                ),
                _inputField(context),
                const SizedBox(
                  height: 20,
                ),
                // _forgotPassword(context),
                const SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   width: 180,
                //   child: SignInButtonGoogle(
                //     label: "Sign In With Google",
                //     onPressed: () async {
                //       Get.off(const HomePageView(), binding: HomePageBinding());
                //       // await GoogleAuthService.signInWithGoogle();
                //     },
                //   ),
                // ),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credentials to login"),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    final ctr = Get.find<SigninController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          controller: ctr.emailController,
          hintText: "Email",
          prefixIcon: const Icon(Icons.person),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: ctr.passwordController,
          hintText: "Password",
          prefixIcon: GestureDetector(
            onTap: () =>
                ctr.passwordNotifier.value = !ctr.passwordNotifier.value,
            child: const Icon(Icons.lock_open),
          ),
          obscureText: ctr.passwordNotifier.value,
          onFieldSubmitted: (_) => {},
        ),
        const SizedBox(height: 10),
        Obx(() => CustomLoadingButton(
              text: "Login",
              isLoading: controller.isLoading.value,
              onPressed: () {
                controller.login();
              },
            ))
      ],
    );
  }

  // Widget _forgotPassword(BuildContext context) {
  //   return TextButton(
  //     onPressed: () {
  //       // Get.to(
  //       //   () => const ForgetPasswordView(),
  //       //   binding: ForgetpasswordBinding(),
  //       // );
  //     },
  //     child: const Text(
  //       "Forget Password?",
  //       style: TextStyle(color: AppColors.purpleColors),
  //     ),
  //   );
  // }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
            onPressed: () {
              Get.off(const SignUpView(), binding: SignUpBinding());
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: AppColors.purpleColors),
            ))
      ],
    );
  }
}
