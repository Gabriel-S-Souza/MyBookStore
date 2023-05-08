import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';

class RegisterBookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterBookStateInitial extends RegisterBookState {
  RegisterBookStateInitial();
}

class RegisterBookStateLoading extends RegisterBookState {
  RegisterBookStateLoading();
}

class RegisterBookStateError extends RegisterBookState {
  final String message;

  RegisterBookStateError(this.message);
}

class RegisterBookStateSuccess extends RegisterBookState {
  final BookEntity bookCreated;
  RegisterBookStateSuccess(this.bookCreated) : super();
}
