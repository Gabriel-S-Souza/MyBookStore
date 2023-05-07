import '../store_base/store_base_entity.dart';

class AuthBaseEntity {
  final String token;
  final String refreshToken;
  final StoreBaseEntity store;

  AuthBaseEntity({
    required this.token,
    required this.refreshToken,
    required this.store,
  });
}
