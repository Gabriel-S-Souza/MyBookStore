import '../../../../core/commom/domain/entities/result.dart';
import '../entities/autorization_entity.dart';
import '../entities/credentials_entity.dart';

abstract class LoginRepository {
  Future<Result<AutorizationEntity>> login(CredentialsEntity credentialsEntity);
}
