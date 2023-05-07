import '../../../../core/commom/domain/entities/result/result.dart';
import '../entities/book_entity.dart';
import '../entities/search_params_entity.dart';
import '../repositories/store_repository.dart';

abstract class GetBooksCase {
  Future<Result<List<BookEntity>>> get(int idStore);
}

class GetBooksCaseImp implements GetBooksCase {
  final StoreRepository _storeRepository;

  GetBooksCaseImp({
    required StoreRepository repository,
  }) : _storeRepository = repository;

  @override
  Future<Result<List<BookEntity>>> get(int idStore) =>
      _storeRepository.searchBooks(SearchParamsEntity.empty(idStore));
}
