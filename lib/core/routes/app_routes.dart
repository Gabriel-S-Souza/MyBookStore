import 'package:flutter/material.dart';

import '../../modules/login/presentation/screens/login_screen.dart';
import '../../modules/store/presentation/screens/home_screen.dart';
import '../../modules/store/presentation/screens/register_store_screen.dart';
import '../commom/domain/entities/dto/user_store_info_dto.dart';
import 'route_names.dart';

class AppRoutes {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.home:
        final userStoreInfoDTO = settings.arguments as UserStoreInfoDTO;
        return MaterialPageRoute(builder: (_) => HomeScreen(userStoreInfoDTO: userStoreInfoDTO));
      case RouteNames.registerStore:
        return MaterialPageRoute(builder: (_) => const RegisterStoreScreen());
      // case '/book':
      //   return MaterialPageRoute(builder: (_) => const BookScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
