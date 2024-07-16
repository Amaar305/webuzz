import 'package:flutter/material.dart';

class BuzzEditor extends StatelessWidget {
  const BuzzEditor({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Start a buzz...',
      ),
      maxLength: 500,
      maxLines: 5,
    );
  }
}
