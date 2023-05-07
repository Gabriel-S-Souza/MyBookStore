import '../../../../commom/domain/entities/result/result.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/credentials_entity.dart';
import '../../domain/repositories/login_repository_interface.dart';
import '../datasources/login_datasource.dart';
import '../models/credentials_model.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImp(this._loginDataSource);

  @override
  Future<Result<AuthEntity>> login(CredentialsEntity credentials) =>
      _loginDataSource.login(CredentialsModel.fromEntity(credentials));
}
