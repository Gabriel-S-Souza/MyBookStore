import '../user_types/user_type.dart';

class UserBaseEntity {
  final int id;
  final String name;
  final String photo;
  final UserType type;

  UserBaseEntity({
    required this.id,
    required this.name,
    required this.photo,
    required this.type,
  });
}
