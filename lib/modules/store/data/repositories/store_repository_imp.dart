import '../../../../commom/domain/entities/result/result.dart';
import '../../../store/domain/entities/auth_entity.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/entities/search_params_entity.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/repositories/store_repository.dart';
import '../datasources/store_datasource.dart';
import '../models/book_model.dart';
import '../models/store_model.dart';

class StoreRepositoryImp implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImp(this._storeDataSource);

  @override
  Future<Result<AuthEntity>> registerStore(StoreEntity store) =>
      _storeDataSource.registerStore(StoreModel.fromEntity(store));

  @override
  Future<Result<List<BookEntity>>> searchBooks(SearchParamsEntity params) =>
      _storeDataSource.searchBooks(params);

  @override
  Future<Result<BookEntity>> registerBook(BookEntity book) =>
      _storeDataSource.registerBook(BookModel.fromEntity(book));
}
