import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/usecases/register_book_case.dart';
import 'register_book_state.dart';

class RegisterBookCubit extends Cubit<RegisterBookState> {
  final RegisterBooksCase _registerBooksCase;
  RegisterBookCubit(
    this._registerBooksCase,
  ) : super(RegisterBookStateInitial());

  Future<void> registerBook(BookEntity book) async {
    emit(RegisterBookStateLoading());
    final result = await _registerBooksCase.registerBook(book);
    if (result.isSuccess) {
      emit(RegisterBookStateSuccess(result.data));
    } else {
      emit(RegisterBookStateError(result.error.message));
    }
  }
}
