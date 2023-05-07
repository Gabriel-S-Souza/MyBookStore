import '../../domain/entities/auth_entity.dart';
import 'store_model.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.token,
    required super.refreshToken,
    required super.store,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        token: json['token'] as String,
        refreshToken: json['refreshToken'] as String,
        store: StoreModel.fromJson(json),
      );
}
