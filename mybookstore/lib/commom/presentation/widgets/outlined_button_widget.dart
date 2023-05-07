import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const OutlinedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: onPressed,
        child: Text(text),
      );
}
