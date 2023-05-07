import 'package:flutter/material.dart';

import '../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../modules/employee/presentation/screens/employee_screen.dart';
import '../../modules/login/presentation/screens/login_screen.dart';
import '../../modules/store/presentation/screens/home_screen.dart';
import '../../modules/store/presentation/screens/register_store_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static PageRouteBuilder<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return PageRouteBuilder(pageBuilder: (context, __, ___) => const LoginScreen());
      case RouteNames.home:
        final userStoreInfoDTO = settings.arguments as UserStoreInfoDTO;
        return PageRouteBuilder(
            pageBuilder: (context, __, ___) => HomeScreen(userStoreInfoDTO: userStoreInfoDTO));
      case RouteNames.registerStore:
        return PageRouteBuilder(pageBuilder: (context, __, ___) => const RegisterStoreScreen());
      case RouteNames.employee:
        final userStoreInfoDTO = settings.arguments as UserStoreInfoDTO;
        return PageRouteBuilder(
            pageBuilder: (context, __, ___) => EmployeeScreen(userStoreInfoDTO: userStoreInfoDTO));
      default:
        return PageRouteBuilder(pageBuilder: (context, __, ___) => const LoginScreen());
    }
  }
}
