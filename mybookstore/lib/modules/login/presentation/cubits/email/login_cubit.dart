import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/credentials_entity.dart';
import '../../../domain/usecase/login_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginCase _loginCase;
  LoginCubit(this._loginCase) : super(const LoginState(errorMessage: 'Mensagem de erro'));

  Future<void> login(CredentialsEntity credentialEntity) async {
    emit(state.startLoading());
    final result = await _loginCase.login(credentialEntity);
    result.when(
      onSuccess: (userStoreInfoDTO) {
        emit(state.loggedIn(userStoreInfoDTO));
      },
      onFailure: (error) => emit(state.copywith(errorMessage: error.message)),
    );
    emit(state.stopLoading());
  }
}
