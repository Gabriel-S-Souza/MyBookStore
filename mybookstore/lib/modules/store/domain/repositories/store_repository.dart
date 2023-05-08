import '../../../../commom/domain/entities/result/result.dart';
import '../../../store/domain/entities/auth_entity.dart';
import '../entities/book_entity.dart';
import '../entities/search_params_entity.dart';
import '../entities/store_entity.dart';

abstract class StoreRepository {
  Future<Result<AuthEntity>> registerStore(StoreEntity store);
  Future<Result<BookEntity>> registerBook(BookEntity book);
  Future<Result<List<BookEntity>>> searchBooks(SearchParamsEntity params);
}
