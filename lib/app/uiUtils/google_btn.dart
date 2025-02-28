import 'package:flutter/material.dart';
import 'package:todo_assignment/app/utils/app_colors.dart';


class SignInButtonGoogle extends StatelessWidget {
  final String label;
  final Future<void> Function() onPressed;

  const SignInButtonGoogle({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.purpleColors,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.purpleColors,
          ),
        ),
      ),
    );
  }
}
