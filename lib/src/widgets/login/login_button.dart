import 'package:assignment_2/src/modules/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.passwordController,
    required this.context,
    required this.state,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController passwordController;
  final BuildContext context;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<LoginBloc>().add(LoginApi());
        }
        passwordController.clear();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orangeAccent,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: state.loginStatus == LoginStatus.loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text(
                'Log in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
