import 'package:assignment_2/src/modules/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.emailRegex,
  });

  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final RegExp emailRegex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: InputDecoration(
            hintText: 'Enter your email',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: state.hasEmailError
                    ? Colors.red
                    : (state.focusField == FocusField.email
                        ? Colors.orange
                        : Colors.grey),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: state.hasEmailError ? Colors.red : Colors.orange,
                width: 1.0,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
          ),
          style: const TextStyle(fontWeight: FontWeight.bold),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Email';
            } else if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        );
      },
    );
  }
}
