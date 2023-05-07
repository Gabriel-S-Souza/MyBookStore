import '../../../../core/commom/domain/entities/store_base/store_base_entity.dart';
import 'user_entity.dart';

class StoreEntity extends StoreBaseEntity {
  StoreEntity({
    super.id,
    required super.name,
    required super.banner,
    required super.slogan,
    required UserEntity user,
  }) : super(
          user: user,
        );
}
