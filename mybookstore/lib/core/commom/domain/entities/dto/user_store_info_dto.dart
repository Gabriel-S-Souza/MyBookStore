import '../store_base/store_base_entity.dart';
import '../user_types/user_type.dart';

class UserStoreInfoDTO {
  final int idUser;
  final int idStore;
  final UserType userType;

  UserStoreInfoDTO({
    required this.idUser,
    required this.idStore,
    required this.userType,
  });

  factory UserStoreInfoDTO.fromStoreEntity(StoreBaseEntity storeEntity) => UserStoreInfoDTO(
        idStore: storeEntity.id!,
        idUser: storeEntity.user.id!,
        userType: storeEntity.user.type,
      );
}
