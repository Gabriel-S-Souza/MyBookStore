import '../user_base/user_base_entity.dart';

class StoreBaseEntity {
  final int id;
  final String name;
  final String banner;
  final String slogan;
  UserBaseEntity user;

  StoreBaseEntity({
    required this.id,
    required this.name,
    required this.banner,
    required this.slogan,
    required this.user,
  });
}
