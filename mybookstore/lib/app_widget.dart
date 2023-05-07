import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_names.dart';
import 'core/theme/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'MyBookStore',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteNames.login,
      );
}
