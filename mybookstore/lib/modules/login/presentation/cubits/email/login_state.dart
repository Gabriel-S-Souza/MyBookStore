import 'package:equatable/equatable.dart';

import '../../../../../core/commom/domain/entities/dto/user_store_info_dto.dart';

class LoginState extends Equatable {
  final UserStoreInfoDTO? userStoreInfoDTO;
  final String username;
  final String password;
  final String? errorMessage;
  final bool isLoading;
  final bool isLogged;

  const LoginState({
    this.username = '',
    this.password = '',
    this.errorMessage,
    this.isLoading = false,
    this.isLogged = false,
    this.userStoreInfoDTO,
  });

  LoginState startLoading() => copywith(isLoading: true);

  LoginState stopLoading() => copywith(isLoading: false);

  LoginState loggedIn(UserStoreInfoDTO userStoreInfoDTO) => copywith(
        isLogged: true,
        userStoreInfoDTO: userStoreInfoDTO,
      );

  LoginState copywith({
    UserStoreInfoDTO? userStoreInfoDTO,
    String? username,
    String? password,
    String? errorMessage,
    bool? isLoading,
    bool? isLogged,
  }) =>
      LoginState(
        userStoreInfoDTO: userStoreInfoDTO ?? this.userStoreInfoDTO,
        username: username ?? this.username,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage,
        isLoading: isLoading ?? this.isLoading,
        isLogged: isLogged ?? this.isLogged,
      );

  @override
  List<Object?> get props => [
        userStoreInfoDTO,
        username,
        password,
        errorMessage,
        isLoading,
        isLogged,
      ];
}
