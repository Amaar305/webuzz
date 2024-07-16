import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.onPressesd,
    required this.label,
  });

  final VoidCallback? onPressesd;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            AppPallete.kPrimaryColour,
            AppPallete.kPrimaryColour2,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressesd,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppPallete.kTransparentColour,
          shadowColor: AppPallete.kTransparentColour,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.8,
            color: AppPallete.kWhiteColour,
          ),
        ),
      ),
    );
  }
}
