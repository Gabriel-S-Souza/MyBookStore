import '../../../../core/commom/domain/entities/result/result.dart';
import '../entities/auth_entity.dart';
import '../entities/credentials_entity.dart';
import '../repositories/login_repository_interface.dart';

abstract class LoginCase {
  Future<Result<AuthEntity>> login(CredentialsEntity credentialsEntity);
}

class LoginCaseImp implements LoginCase {
  final LoginRepository _repository;

  LoginCaseImp(this._repository);

  @override
  Future<Result<AuthEntity>> login(CredentialsEntity credentialsEntity) =>
      _repository.login(credentialsEntity);
}
