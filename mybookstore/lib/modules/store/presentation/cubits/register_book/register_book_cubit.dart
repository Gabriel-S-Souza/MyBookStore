import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_book_state.dart';

class RegisterBookCubit extends Cubit<RegisterBookState> {
  RegisterBookCubit() : super(const RegisterBookStateInitial());
}
