import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/search_params_entity.dart';
import '../../../domain/usecases/get_books_case.dart';
import '../../../domain/usecases/search_books_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetBooksCase _getBooksCase;
  final SearchBooksCase _searchBooksCase;
  HomeCubit({
    required GetBooksCase getBooksCase,
    required SearchBooksCase searchBooksCase,
  })  : _getBooksCase = getBooksCase,
        _searchBooksCase = searchBooksCase,
        super(const HomeStateInitial());

  Future<void> getBooks(int idStore) async {
    emit(const HomeStateLoading());
    final result = await _getBooksCase.getBooks(idStore);
    result.when(
      onSuccess: (books) => emit(books.isEmpty ? const HomeStateEmpty() : HomeStateSuccess(books)),
      onFailure: (error) => emit(HomeStateError(error.message)),
    );
  }

  Future<void> searchBooks(SearchParamsEntity params) async {
    emit(const HomeStateLoading());
    final result = await _searchBooksCase.searchBooks(params);
    result.when(
      onSuccess: (books) => emit(books.isEmpty ? const HomeStateEmpty() : HomeStateSuccess(books)),
      onFailure: (error) => emit(HomeStateError(error.message)),
    );
  }
}
