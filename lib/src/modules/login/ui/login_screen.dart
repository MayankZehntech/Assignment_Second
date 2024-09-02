import 'package:assignment_2/src/modules/home/ui/home_page.dart';
import 'package:assignment_2/src/modules/login/bloc/login_bloc.dart';
import 'package:assignment_2/src/modules/temp/ui/temp_page.dart';
import 'package:assignment_2/src/widgets/login/login_button.dart';
import 'package:assignment_2/src/widgets/login/login_email_textfield.dart';
import 'package:assignment_2/src/widgets/login/login_password_textfield.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  // focusNode for email
  final emailFocusNode = FocusNode();
  //focusNode for password
  final passwordFocusNode = FocusNode();

  // Email and password controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Email regex for validation
  final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  @override
  void dispose() {
    // Dispose of the focus nodes and controllers
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();

    // Add listeners to notify Bloc on focus change
    emailFocusNode.addListener(() {
      _loginBloc.add(FocusChanged(
          focusField:
              emailFocusNode.hasFocus ? FocusField.email : FocusField.none));
    });
    passwordFocusNode.addListener(() {
      _loginBloc.add(FocusChanged(
          focusField: passwordFocusNode.hasFocus
              ? FocusField.password
              : FocusField.none));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => _loginBloc,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                // if error occur then we show the snackbar
                if (state.loginStatus == LoginStatus.error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text(state.message.toString())),
                    );
                  state.loginStatus = LoginStatus.initial;
                }

                // if user credential are correct then it will redirect to the homepage
                if (state.loginStatus == LoginStatus.success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                  state.loginStatus = LoginStatus.initial;
                }
              },
              builder: (context, state) {
                return Form(
                  //formkey check the status of form
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(height: 10),
                      const Text('Login in with your credentials'),
                      const SizedBox(height: 35),
                      Text(
                        'Username',
                        style: TextStyle(
                          color: state.focusField == FocusField.email
                              ? Colors.orange
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),

                      //calling email field
                      EmailTextField(
                          emailController: emailController,
                          emailFocusNode: emailFocusNode,
                          emailRegex: emailRegex),
                      const SizedBox(height: 20),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: state.focusField == FocusField.password
                              ? Colors.orange
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // calling email field method
                      PasswordTextField(
                          passwordController: passwordController,
                          passwordFocusNode: passwordFocusNode),

                      // forget password section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TempPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),

                      //calling login button
                      LoginButton(
                          formKey: _formKey,
                          passwordController: passwordController,
                          context: context,
                          state: state),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
