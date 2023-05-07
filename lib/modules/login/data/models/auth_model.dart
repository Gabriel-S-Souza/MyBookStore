import '../../../../core/commom/data/models/store_base_model.dart';
import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.token,
    required super.refreshToken,
    required super.store,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        token: json['token'] as String,
        refreshToken: json['refreshToken'] as String,
        store: StoreBaseModel.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'refreshToken': refreshToken,
      };
}
