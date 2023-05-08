import '../user_types/user_type.dart';

class UserBaseEntity {
  int? id;
  final String name;
  final String photo;
  final UserType type;
  final String? username;
  final String? password;

  UserBaseEntity({
    this.id,
    required this.name,
    required this.photo,
    required this.type,
    this.username,
    this.password,
  });
}
