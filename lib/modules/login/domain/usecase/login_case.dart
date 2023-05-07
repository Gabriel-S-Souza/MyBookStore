import '../../../../core/commom/domain/entities/result.dart';
import '../entities/autorization_entity.dart';
import '../entities/credentials_entity.dart';
import '../repositories/login_repository_interface.dart';

abstract class LoginCase {
  Future<Result<AutorizationEntity>> login(CredentialsEntity credentialsEntity);
}

class LoginCaseImp implements LoginCase {
  final LoginRepository _repository;

  LoginCaseImp(this._repository);

  @override
  Future<Result<AutorizationEntity>> login(CredentialsEntity credentialsEntity) =>
      _repository.login(credentialsEntity);
}
