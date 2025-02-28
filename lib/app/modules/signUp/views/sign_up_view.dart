import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_assignment/app/uiUtils/custom_btn.dart';
import 'package:todo_assignment/app/uiUtils/custom_textfiled.dart';
import 'package:todo_assignment/app/uiUtils/google_btn.dart';
import 'package:todo_assignment/app/utils/app_colors.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Title and subtitle
              Column(
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),

              // Form fields with validation
              Column(
                children: [
                  const SizedBox(height: 20),
                  Obx(() => CustomTextField(
                    controller: controller.emailController,
                    hintText: "Email",
                    errorText: controller.emailError.value.isNotEmpty ? controller.emailError.value : null,
                    prefixIcon: const Icon(Icons.email),
                  )),
                  const SizedBox(height: 20),
                  Obx(() => CustomTextField(
                    controller: controller.passwordController,
                    hintText: "Password",
                    errorText: controller.passwordError.value.isNotEmpty ? controller.passwordError.value : null,
                    prefixIcon: const Icon(Icons.lock_outline),
                    obscureText: true,
                  )),
                  const SizedBox(height: 20),
                  Obx(() => CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintText: "Confirm Password",
                    errorText: controller.confirmPasswordError.value?.isNotEmpty ?? true? controller.confirmPasswordError.value : null,
                    prefixIcon: const Icon(Icons.lock_outline),
                    obscureText: true,
                    
                  )),
                ],
              ),


              // Signup Button
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child:Obx(() => CustomLoadingButton(
                    text: "SignUp",
                    isLoading: controller.isLoading.value,
                    onPressed: (){
                      
                    },
                  ))
              
              ),

              const Center(child: Text( "Or")),

              // Sign In with Google Button
              SignInButtonGoogle(
                label: "Sign In with Google",
                onPressed: () async {
                  // await GoogleAuthService.signInWithGoogle();
                },
              ),

              // Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text( "Already have an account ?"),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/signin");
                      },
                      child: const Text(
                       "Login",
                        style: TextStyle(color: AppColors.purpleColors),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
