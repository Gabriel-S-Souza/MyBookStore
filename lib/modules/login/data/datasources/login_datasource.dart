import '../../../../commom/domain/entities/result/result.dart';
import '../../domain/entities/auth_entity.dart';
import '../models/credentials_model.dart';

abstract class LoginDataSource {
  Future<Result<AuthEntity>> login(CredentialsModel credentials);
}
