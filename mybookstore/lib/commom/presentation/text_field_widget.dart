import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  const TextFieldWidget({
    super.key,
    this.label,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
        ),
        validator: validator,
      );
}
