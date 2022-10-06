import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../services/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;
  LoginCubit({required this.repository}) : super(LoginInitial());
}
