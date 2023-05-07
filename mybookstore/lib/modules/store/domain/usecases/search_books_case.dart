import '../../../../commom/domain/entities/result/result.dart';
import '../entities/book_entity.dart';
import '../entities/search_params_entity.dart';
import '../repositories/store_repository.dart';

abstract class SearchBooksCase {
  Future<Result<List<BookEntity>>> searchBooks(SearchParamsEntity params);
}

class SearchBooksCaseImp implements SearchBooksCase {
  final StoreRepository _storeRepository;

  SearchBooksCaseImp({
    required StoreRepository repository,
  }) : _storeRepository = repository;

  @override
  Future<Result<List<BookEntity>>> searchBooks(SearchParamsEntity params) =>
      _storeRepository.searchBooks(params);
}
