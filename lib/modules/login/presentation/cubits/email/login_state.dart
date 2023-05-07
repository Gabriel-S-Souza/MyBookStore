part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String username;
  final String password;

  const LoginState({
    this.username = '',
    this.password = '',
  });

  LoginState copywith({
    String? username,
    String? password,
  }) =>
      LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [username, password];
}

class LoginLoading extends LoginState {}
