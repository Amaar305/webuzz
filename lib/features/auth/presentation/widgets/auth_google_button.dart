import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthGoogleButton extends StatelessWidget {
  const AuthGoogleButton({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppPallete.kInputBorderColour,
          width: 1,
        ),
        fixedSize: const Size(395, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      label: const Text(
        'Google',
        style: TextStyle(
          color: AppPallete.kBlackColour,
          fontSize: 14.8,
        ),
      ),
      icon: SizedBox(
        width: 30,
        child: Image.asset(
          'assets/images/google.jpeg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
