import '../../../../core/commom/domain/entities/auth_base_entity.dart/auth_base_entity.dart';

class AuthEntity extends AuthBaseEntity {
  AuthEntity({
    required super.token,
    required super.refreshToken,
    required super.store,
  });
}
