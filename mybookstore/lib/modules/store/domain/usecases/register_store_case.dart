import '../../../../commom/data/datasources/local_storage.dart';
import '../../../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../commom/domain/entities/result/result.dart';
import '../../../../commom/domain/entities/storage_keys/storage_keys.dart';
import '../entities/store_entity.dart';
import '../repositories/store_repository.dart';

abstract class RegisterStoreCase {
  Future<Result<UserStoreInfoDTO>> register(StoreEntity store);
}

class RegisterStoreCaseImp implements RegisterStoreCase {
  final StoreRepository _storeRepository;
  // TODO: Create repository to LocalStorage
  final LocalStorage _localStorage;

  RegisterStoreCaseImp({
    required StoreRepository repository,
    required LocalStorage localStorage,
  })  : _storeRepository = repository,
        _localStorage = localStorage;

  @override
  Future<Result<UserStoreInfoDTO>> register(StoreEntity store) async {
    final result = await _storeRepository.registerStore(store);
    if (result.isSuccess) {
      _localStorage.set(key: StorageKeys.token, value: result.data.token);
      _localStorage.set(key: StorageKeys.refreshToken, value: result.data.refreshToken);
      return Result.success(UserStoreInfoDTO.fromStoreEntity(result.data.store));
    } else {
      return Result.failure(result.error);
    }
  }
}
