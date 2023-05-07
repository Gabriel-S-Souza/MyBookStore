import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../domain/entities/credentials_entity.dart';
import '../../../domain/usecase/login_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginCase _loginCase;
  LoginCubit(this._loginCase) : super(const LoginState(errorMessage: 'Mensagem de erro'));

  Future<void> login(CredentialsEntity credentialEntity) async {
    emit(state.startLoading());
    final result = await _loginCase.login(credentialEntity);
    result.when(
      onSuccess: (auth) {
        final userStoreInfoDTO = UserStoreInfoDTO.fromStoreEntity(auth.store);
        emit(state.loggedIn(userStoreInfoDTO));
      },
      onFailure: (error) => emit(state.copywith(errorMessage: error.message)),
    );
    emit(state.stopLoading());
  }
}
