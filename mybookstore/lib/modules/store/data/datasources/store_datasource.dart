import '../../../../commom/domain/entities/result/result.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/entities/search_params_entity.dart';
import '../models/store_model.dart';

abstract class StoreDataSource {
  Future<Result<AuthEntity>> registerStore(StoreModel store);
  Future<Result<List<BookEntity>>> searchBooks(SearchParamsEntity params);
}
