import '../../../../core/commom/domain/entities/store_base/store_base_entity.dart';

class AuthEntity {
  final String token;
  final String refreshToken;
  final StoreBaseEntity store;

  AuthEntity({
    required this.token,
    required this.refreshToken,
    required this.store,
  });
}
