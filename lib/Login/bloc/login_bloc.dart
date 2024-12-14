import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/Login/Enums/login_enum.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChangeEvent>(_emailchangeevent);
    on<PasswordChangeEvent>(_passwordchangeevent);
  }

  void _emailchangeevent(EmailChangeEvent event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _passwordchangeevent(
      PasswordChangeEvent event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
}
