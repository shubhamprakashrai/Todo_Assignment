import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar({
  required String title,
  required String message,
  required bool isError,
}) {
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 2),
    icon: Icon(
      isError ? Icons.error_outline : Icons.check_circle_outline,
      color: isError ? Colors.red : Colors.green,
    ),
    titleText: Text(
      title,
      style: const TextStyle(fontSize: 14, fontFamily: 'PacaembuRegular'),
    ),
    messageText: Text(
      message,
      style: const TextStyle(
        color: Color(0xff717171),
        fontSize: 12,
        fontFamily: 'PacaembuMedium',
        overflow: TextOverflow.ellipsis,
      ),
    ),
    colorText: Colors.black,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
    margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
    boxShadows: [
      BoxShadow(
        blurRadius: 2,
        color: Colors.grey.shade400,
      ),
    ],
  );
}
