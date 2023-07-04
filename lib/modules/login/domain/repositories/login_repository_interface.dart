import '../../../../commom/domain/entities/result/result.dart';
import '../entities/auth_entity.dart';
import '../entities/credentials_entity.dart';

abstract class LoginRepository {
  Future<Result<AuthEntity>> login(CredentialsEntity credentialsEntity);
}
