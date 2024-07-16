import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class OutlineIconButton extends StatelessWidget {
  const OutlineIconButton({
    super.key,
    required this.icon,
  });

  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppPallete.kPrimaryColour.withOpacity(0.5),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
