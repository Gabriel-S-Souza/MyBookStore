import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: _ColorsApp.primary.color,
    background: _ColorsApp.background.color,
  ),
  scaffoldBackgroundColor: const Color(0xFFF2F2F2),
);

enum _ColorsApp {
  primary(Color.fromARGB(255, 33, 32, 32)),
  background(Color(0xFFF2F2F2));

  final Color color;

  const _ColorsApp(this.color);
}
