import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      );
}
