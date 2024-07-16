import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    required this.hintext,
    this.obscureText = false,
    required this.controller,
    this.inputType,
  });

  final String label;
  final String hintext;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppPallete.kInputTextColour,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            keyboardType: inputType,
            validator: (value) {
              if (value!.isEmpty) {
                return '$hintext is missing';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter your $hintext',
            ),
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
