import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Divider()),
        Text(
          'Or',
          style: TextStyle(
            color: AppPallete.kInputTextColour,
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
