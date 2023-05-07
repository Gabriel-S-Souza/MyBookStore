import '../../domain/entities/credentials_entity.dart';

class CredentialsModel extends CredentialsEntity {
  CredentialsModel({required super.username, required super.password});

  factory CredentialsModel.fromEntity(CredentialsEntity entity) => CredentialsModel(
        username: entity.username,
        password: entity.password,
      );

  Map<String, dynamic> toJson() => {
        'user': username,
        'password': password,
      };
}
