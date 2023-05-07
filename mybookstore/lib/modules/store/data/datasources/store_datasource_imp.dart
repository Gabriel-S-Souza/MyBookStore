import '../../../../commom/data/datasources/local_storage.dart';
import '../../../../commom/domain/entities/failure/failure.dart';
import '../../../../commom/domain/entities/result/result.dart';
import '../../../../commom/domain/entities/storage_keys/storage_keys.dart';
import '../../../../core/http/http_client.dart';
import '../../../../core/utils/api_paths.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/entities/search_params_entity.dart';
import '../models/auth_model.dart';
import '../models/book_model.dart';
import '../models/store_model.dart';
import 'store_datasource.dart';

class StoreDataSourceImp implements StoreDataSource {
  final HttpClient _httpClient;
  final LocalStorage _localStorage;

  StoreDataSourceImp({
    required HttpClient httpClient,
    required LocalStorage localStorage,
  })  : _httpClient = httpClient,
        _localStorage = localStorage;

  @override
  Future<Result<AuthEntity>> registerStore(StoreModel store) async {
    try {
      final response = await _httpClient.post(
        ApiPaths.store,
        body: store.toJson(),
        token: _localStorage.get(StorageKeys.token),
      );
      return Result.success(AuthModel.fromJson(response.data));
    } on Failure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnmappedFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<BookEntity>>> searchBooks(SearchParamsEntity params) async {
    try {
      final String path;

      if (params.isEmpty) {
        path = '${ApiPaths.store}/${params.idStore}/book';
      } else {
        path = '${ApiPaths.store}/${params.idStore}/book?q=${params.queryParams}';
      }

      final response = await _httpClient.get(
        path,
        token: _localStorage.get(StorageKeys.token),
      );

      if (response.isOk) {
        final List<BookModel> books = [];
        for (final book in response.data) {
          books.add(BookModel.fromJson(book));
        }
        return Result.success(books);
      } else {
        return Result.failure(UnmappedFailure(response.data.toString()));
      }
    } on Failure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnmappedFailure(e.toString()));
    }
  }
}
