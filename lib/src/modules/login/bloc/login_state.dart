part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

// ignore: must_be_immutable
class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  late LoginStatus loginStatus;
  final bool isObsure;
  final bool hasEmailError;
  final bool hasPasswordError;
  final FocusField focusField;

  LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial,
    required this.isObsure,
    this.hasEmailError = false,
    this.hasPasswordError = false,
    this.focusField = FocusField.none,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
    bool? isObsure,
    bool? hasEmailError,
    bool? hasPasswordError,
    FocusField? focusField,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
      isObsure: isObsure ?? this.isObsure,
      hasEmailError: hasEmailError ?? this.hasEmailError,
      hasPasswordError: hasPasswordError ?? this.hasPasswordError,
      focusField: focusField ?? this.focusField,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        message,
        loginStatus,
        isObsure,
        hasEmailError,
        hasPasswordError,
        focusField
      ];
}
