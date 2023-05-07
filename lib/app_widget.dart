import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_names.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'MyBookStore',
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        initialRoute: RouteNames.login,
      );
}
