import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(isObsure: true)) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
    on<PasswordVisibility>(_onPasswordVisibility);
    on<FocusChanged>(_onFocusChanged);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = event.email;
    final hasEmailError =
        !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email);

    emit(state.copyWith(
      email: email,
      hasEmailError: hasEmailError,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    final hasPasswordError = password.isEmpty;

    emit(state.copyWith(
      password: password,
      hasPasswordError: hasPasswordError,
    ));
  }

  void _onPasswordVisibility(
      PasswordVisibility event, Emitter<LoginState> emit) {
    emit(state.copyWith(isObsure: !state.isObsure));
  }

  void _onFocusChanged(FocusChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(focusField: event.focusField));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      loginStatus: LoginStatus.loading,
    ));

    Map data = {'email': state.email, 'password': state.password};

    try {
      final response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
      var data1 = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(state.copyWith(
          loginStatus: LoginStatus.success,
          message: 'Login successfull',
        ));
      } else {
        emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: data1['error'],
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: e.toString(),
      ));
    }
    state.copyWith(loginStatus: LoginStatus.initial);
  }
}
