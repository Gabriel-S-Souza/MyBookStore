import '../../domain/entities/store_base/store_base_entity.dart';
import 'user_base_model.dart';

class StoreBaseModel extends StoreBaseEntity {
  StoreBaseModel({
    required super.id,
    required super.name,
    required super.banner,
    required super.slogan,
    required super.user,
  });

  factory StoreBaseModel.fromJson(Map<String, dynamic> json) => StoreBaseModel(
        id: json['store']['id'],
        name: json['store']['name'],
        banner: json['store']['banner'],
        slogan: json['store']['slogan'],
        user: UserBaseModel.fromJson(json['user']),
      );
}
