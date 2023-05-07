import '../user_types/user_type.dart';

class UserBaseEntity {
  int? id;
  final String name;
  final String photo;
  final UserType type;

  UserBaseEntity({
    this.id,
    required this.name,
    required this.photo,
    required this.type,
  });
}
