import '../../../../commom/domain/entities/user_base/user_base_entity.dart';
import '../../../../commom/domain/entities/user_types/user_type.dart';

class UserEntity extends UserBaseEntity {
  final String username;
  final String password;

  UserEntity({
    super.id,
    required super.name,
    required super.photo,
    required super.type,
    required this.username,
    required this.password,
  });

  factory UserEntity.read({
    required int id,
    required String name,
    required String photo,
    UserType type = UserType.employee,
  }) =>
      UserEntity(
        id: id,
        name: name,
        photo: photo,
        type: type,
        username: '',
        password: '',
      );

  factory UserEntity.register({
    int? id,
    required String name,
    required String photo,
    UserType type = UserType.employee,
    required String username,
    required String password,
  }) =>
      UserEntity(
        id: id,
        name: name,
        photo: photo,
        type: type,
        username: username,
        password: password,
      );
}
