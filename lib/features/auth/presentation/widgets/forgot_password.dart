import 'package:flutter/material.dart';
import 'package:webuzz/core/theme/app_pallete.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: const Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: AppPallete.kRedColour,
            ),
          ),
        )
      ],
    );
  }
}
