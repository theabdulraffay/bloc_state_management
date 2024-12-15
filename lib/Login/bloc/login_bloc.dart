import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/Login/Enums/login_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChangeEvent>(_emailchangeevent);
    on<PasswordChangeEvent>(_passwordchangeevent);
    on<LoginAPIEvent>(_loginapi);
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

  void _loginapi(LoginAPIEvent event, Emitter<LoginState> emit) async {
    Map data = {'email': state.email, 'password': state.password};
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: data,
      );

      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.success,
            message: 'Login Successfull',
          ),
        );
      } else {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
            message: jsonDecode(response.body)['error'],
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(message: e.toString(), loginStatus: LoginStatus.error),
      );
      return;
    }
  }
}
