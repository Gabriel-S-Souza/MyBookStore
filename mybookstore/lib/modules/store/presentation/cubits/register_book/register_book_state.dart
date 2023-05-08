import 'package:equatable/equatable.dart';

class RegisterBookState extends Equatable {
  final String? response;

  const RegisterBookState([this.response]);

  @override
  List<Object?> get props => [response];
}

class RegisterBookStateInitial extends RegisterBookState {
  const RegisterBookStateInitial();
}

class RegisterBookStateLoading extends RegisterBookState {
  const RegisterBookStateLoading();
}

class RegisterBookStateError extends RegisterBookState {
  final String message;

  const RegisterBookStateError(this.message);
}

class RegisterBookStateSuccess extends RegisterBookState {
  const RegisterBookStateSuccess(String response) : super(response);
}
