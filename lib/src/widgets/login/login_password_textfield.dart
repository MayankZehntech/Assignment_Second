import 'package:assignment_2/src/modules/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          obscureText: state.isObsure,
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: const TextStyle(fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: state.hasPasswordError
                      ? Colors.red
                      : (state.focusField == FocusField.password
                          ? Colors.orange
                          : Colors.grey),
                  width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: state.hasPasswordError ? Colors.red : Colors.orange,
                  width: 1), // Border color when focused
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            suffixIcon: IconButton(
              icon: Icon(
                state.isObsure ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(PasswordVisibility());
              },
            ),
          ),
          style: const TextStyle(fontWeight: FontWeight.bold),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            return null;
          },
        );
      },
    );
  }
}
