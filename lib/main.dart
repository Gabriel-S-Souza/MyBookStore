import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app_widget.dart';
import 'core/di/service_locator_imp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocatorImp(GetIt.instance).setupLocator();
  runApp(const AppWidget());
}
