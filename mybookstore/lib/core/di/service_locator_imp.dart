import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../http/dio_config.dart';
import '../http/http_client.dart';
import 'service_locator.dart';

class ServiceLocatorImp implements ServiceLocator {
  static final ServiceLocatorImp I = ServiceLocatorImp._internal();

  factory ServiceLocatorImp([GetIt? getIt]) {
    I._getIt = getIt ?? GetIt.instance;
    return I;
  }

  ServiceLocatorImp._internal();

  late final GetIt _getIt;

  @override
  Future<void> setupLocator() async {}

  @override
  T get<T extends Object>() => _getIt.get<T>();

  @override
  void registerFactory<T extends Object>(T Function() factory) {
    _getIt.registerFactory<T>(factory);
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton<T>(instance);
  }
}
