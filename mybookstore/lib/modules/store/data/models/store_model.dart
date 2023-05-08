import '../../domain/entities/store_entity.dart';
import 'user_model.dart';

class StoreModel extends StoreEntity {
  final UserModel userModel;
  StoreModel({
    super.id,
    required super.name,
    required super.banner,
    required super.slogan,
    required this.userModel,
  }) : super(user: userModel);

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['store']['id'],
        name: json['store']['name'],
        banner: json['store']['banner'],
        slogan: json['store']['slogan'],
        userModel: UserModel.fromJson(json['user']),
      );

  factory StoreModel.fromEntity(StoreEntity entity) => StoreModel(
      id: entity.id,
      name: entity.name,
      banner: entity.banner,
      slogan: entity.slogan,
      userModel: UserModel(
        id: entity.user.id,
        name: entity.user.name,
        photo: entity.user.photo,
        type: entity.user.type,
        username: entity.user.username!,
        password: entity.user.password!,
      ));

  Map<String, dynamic> toJson() => {
        'name': name,
        'banner': banner,
        'slogan': slogan,
        'admin': userModel.toJson(),
      };
}
