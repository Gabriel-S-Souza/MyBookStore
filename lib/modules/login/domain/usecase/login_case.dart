import '../../../../core/commom/data/datasources/local_storage_imp.dart';
import '../../../../core/commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../core/commom/domain/entities/result/result.dart';
import '../../../../core/commom/domain/entities/storage_keys/storage_keys.dart';
import '../entities/credentials_entity.dart';
import '../repositories/login_repository_interface.dart';

abstract class LoginCase {
  Future<Result<UserStoreInfoDTO>> login(CredentialsEntity credentialsEntity);
}

class LoginCaseImp implements LoginCase {
  final LoginRepository _loginRepository;
  // TODO: Create repository to LocalStorage
  final LocalStorage _localStorage;

  LoginCaseImp({
    required LoginRepository repository,
    required LocalStorage localStorage,
  })  : _loginRepository = repository,
        _localStorage = localStorage;

  @override
  Future<Result<UserStoreInfoDTO>> login(CredentialsEntity credentialsEntity) async {
    final result = await _loginRepository.login(credentialsEntity);
    result.when(
      onSuccess: (auth) {
        _localStorage.set(key: StorageKeys.token, value: auth.token);
        _localStorage.set(key: StorageKeys.refreshToken, value: auth.refreshToken);
      },
    );

    return result.isSuccess
        ? Result.success(UserStoreInfoDTO.fromStoreEntity(result.data.store))
        : Result.failure(result.error);
  }
}
