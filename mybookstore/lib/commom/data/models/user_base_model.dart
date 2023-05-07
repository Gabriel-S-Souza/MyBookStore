import '../../domain/entities/user_base/user_base_entity.dart';
import '../../domain/entities/user_types/user_type.dart';

class UserBaseModel extends UserBaseEntity {
  UserBaseModel({
    required super.id,
    required super.name,
    required super.photo,
    required super.type,
  });

  factory UserBaseModel.fromJson(Map<String, dynamic> json) => UserBaseModel(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        type: json['type'] == 'Employee' ? UserType.employee : UserType.admin,
      );
}
