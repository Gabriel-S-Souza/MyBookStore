import '../../../../commom/domain/entities/result/result.dart';
import '../entities/book_entity.dart';
import '../repositories/store_repository.dart';

abstract class RegisterBooksCase {
  Future<Result<BookEntity>> registerBook(BookEntity book);
}

class RegisterBooksCaseImp implements RegisterBooksCase {
  final StoreRepository _storeRepository;

  RegisterBooksCaseImp({
    required StoreRepository repository,
  }) : _storeRepository = repository;

  @override
  Future<Result<BookEntity>> registerBook(book) => _storeRepository.registerBook(book);
}
