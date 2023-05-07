import '../../../../core/commom/domain/entities/result.dart';
import '../../domain/entities/autorization_entity.dart';
import '../../domain/entities/credentials_entity.dart';
import '../../domain/repositories/login_repository_interface.dart';

class LoginRepositoryImp implements LoginRepository {
  // final LoginDataSource loginDataSource;

  // LoginRepositoryImp(this.loginDataSource);

  @override
  // ignore: prefer_expression_function_bodies
  Future<Result<AutorizationEntity>> login(CredentialsEntity credentials) async {
    // try {
    //   final result = await loginDataSource.login(credentials);
    //   return Result.success(result);
    // } on Failure catch (e) {
    //   return Result.failure(e);
    // }
    return Result.success(AutorizationEntity(
      refreshToken: 'fklsmf',
      token: 'fksmfkms',
    ));
  }
}
