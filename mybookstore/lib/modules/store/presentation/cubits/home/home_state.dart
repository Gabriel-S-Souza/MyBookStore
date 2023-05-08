import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';

class HomeState extends Equatable {
  final List<BookEntity> books;

  const HomeState([this.books = const []]);

  @override
  List<Object?> get props => [books];
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading();
}

class HomeStateEmpty extends HomeState {
  const HomeStateEmpty();
}

class HomeStateError extends HomeState {
  final String message;

  const HomeStateError(this.message);
}

class HomeStateSuccess extends HomeState {
  const HomeStateSuccess(List<BookEntity> books) : super(books);
}
