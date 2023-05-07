import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/login/data/datasources/login_datasource.dart';
import '../../modules/login/data/datasources/login_datasource_imp.dart';
import '../../modules/login/data/repositories/login_repository_imp.dart';
import '../../modules/login/domain/repositories/login_repository_interface.dart';
import '../../modules/login/domain/usecase/login_case.dart';
import '../../modules/login/presentation/cubits/email/login_cubit.dart';
import '../../modules/store/data/datasources/store_datasource.dart';
import '../../modules/store/data/datasources/store_datasource_imp.dart';
import '../../modules/store/data/repositories/store_repository_imp.dart';
import '../../modules/store/domain/repositories/store_repository.dart';
import '../../modules/store/domain/usecases/get_books_case.dart';
import '../../modules/store/domain/usecases/register_store_case.dart';
import '../../modules/store/domain/usecases/search_books_case.dart';
import '../../modules/store/presentation/cubits/home/home_cubit.dart';
import '../commom/data/datasources/local_storage.dart';
import '../commom/data/datasources/local_storage_imp.dart';
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
  Future<void> setupLocator() async {
    // http
    registerFactory<HttpClient>(() => HttpClient(dioApp));

    // local storage
    final prefs = await SharedPreferences.getInstance();
    registerFactory<LocalStorage>(() => LocalStorageImp(prefs));

    // data sources
    registerFactory<LoginDataSource>(() => LoginDataSourceImp(
          httpClient: get(),
          localStorage: get(),
        ));

    registerFactory<StoreDataSource>(() => StoreDataSourceImp(
          httpClient: get(),
          localStorage: get(),
        ));

    // repositories
    registerFactory<LoginRepository>(() => LoginRepositoryImp(get()));

    registerFactory<StoreRepository>(() => StoreRepositoryImp(get()));

    // use cases
    registerFactory<LoginCase>(() => LoginCaseImp(
          localStorage: get(),
          repository: get(),
        ));

    registerFactory<RegisterStoreCase>(() => RegisterStoreCaseImp(
          localStorage: get(),
          repository: get(),
        ));

    registerFactory<GetBooksCase>(() => GetBooksCaseImp(repository: get()));

    registerFactory<SearchBooksCase>(() => SearchBooksCaseImp(repository: get()));

    // cubits
    registerFactory<LoginCubit>(() => LoginCubit(get()));

    registerFactory<HomeCubit>(() => HomeCubit(
          getBooksCase: get(),
          searchBooksCase: get(),
        ));
  }

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
