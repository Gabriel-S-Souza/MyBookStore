import 'package:equatable/equatable.dart';

import '../../../../../commom/domain/entities/dto/user_store_info_dto.dart';

class RegisterStoreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterStoreStateInitial extends RegisterStoreState {
  RegisterStoreStateInitial();
}

class RegisterStoreStateLoading extends RegisterStoreState {
  RegisterStoreStateLoading();
}

class RegisterStoreStateError extends RegisterStoreState {
  final String message;

  RegisterStoreStateError(this.message);
}

class RegisterStoreStateSuccess extends RegisterStoreState {
  final UserStoreInfoDTO userStoreInfoDTO;
  RegisterStoreStateSuccess(this.userStoreInfoDTO);
}
