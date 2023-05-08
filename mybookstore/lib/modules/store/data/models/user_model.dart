import '../../../../commom/domain/entities/user_types/user_type.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.photo,
    required super.type,
    required super.username,
    required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel.read(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        type: json['type'] == 'Employee' ? UserType.employee : UserType.admin,
      );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        name: entity.name,
        photo: entity.photo,
        type: entity.type,
        username: entity.username,
        password: entity.password,
      );

  factory UserModel.read({
    required int id,
    required String name,
    required String photo,
    UserType type = UserType.employee,
  }) =>
      UserModel(
        id: id,
        name: name,
        photo: photo,
        type: type,
        username: '',
        password: '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'photo': photo,
        'username': username,
        'password': password,
      };
}
