import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_assignment/app/utils/app_colors.dart';

class CustomSnackBar {
  static void showSnackbar({
    required String title,
    required String message,
    bool isError = false,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ?AppColors.red : AppColors.green,
      colorText:AppColors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color:AppColors.white,
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
