import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/store_entity.dart';
import '../../../domain/usecases/register_store_case.dart';
import 'register_store_state.dart';

class RegisterStoreCubit extends Cubit<RegisterStoreState> {
  final RegisterStoreCase _registerStoreCase;
  RegisterStoreCubit(
    this._registerStoreCase,
  ) : super(RegisterStoreStateInitial());

  Future<void> registerStore(StoreEntity store) async {
    emit(RegisterStoreStateLoading());
    final result = await _registerStoreCase.register(store);
    if (result.isSuccess) {
      emit(RegisterStoreStateSuccess(result.data));
    } else {
      emit(RegisterStoreStateError(result.error.message));
    }
  }
}
