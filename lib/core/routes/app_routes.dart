import 'package:flutter/material.dart';

import '../../modules/login/presentation/screens/login_screen.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes =
      <String, Widget Function(BuildContext)>{
    '/login': (context) => const LoginScreen(),
    // '/home': (context) => const HomeScreen(),
    // '/book': (context) => const BookScreen(),
  };
}
