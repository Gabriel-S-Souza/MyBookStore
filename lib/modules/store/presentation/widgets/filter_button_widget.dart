import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const FilterButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.filter_alt),
      );
}
