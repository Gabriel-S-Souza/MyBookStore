import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool readOnly;
  const TextFieldWidget({
    super.key,
    this.label,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: readOnly,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.all(0).copyWith(left: 10),
            labelStyle: const TextStyle(fontSize: 14),
            border: const OutlineInputBorder(),
            prefixIcon: prefixIcon,
          ),
          validator: validator,
        ),
      );
}
