import '../../../../core/commom/data/datasources/local_storage.dart';
import '../../../../core/commom/domain/entities/failure/failure.dart';
import '../../../../core/commom/domain/entities/result/result.dart';
import '../../../../core/commom/domain/entities/storage_keys/storage_keys.dart';
import '../../../../core/http/http_client.dart';
import '../../../../core/utils/api_paths.dart';
import '../../domain/entities/auth_entity.dart';
import '../models/auth_model.dart';
import '../models/credentials_model.dart';
import 'login_datasource.dart';

class LoginDataSourceImp implements LoginDataSource {
  final HttpClient _httpClient;
  final LocalStorage _localStorage;

  LoginDataSourceImp({
    required HttpClient httpClient,
    required LocalStorage localStorage,
  })  : _httpClient = httpClient,
        _localStorage = localStorage;

  @override
  Future<Result<AuthEntity>> login(CredentialsModel credentials) async {
    try {
      final response = await _httpClient.post(
        ApiPaths.auth,
        body: credentials.toJson(),
        token: _localStorage.get(StorageKeys.token),
      );
      return Result.success(AuthModel.fromJson(response.data));
    } on Failure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnmappedFailure(e.toString()));
    }
  }
}
