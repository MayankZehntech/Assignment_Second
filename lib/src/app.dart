import 'package:assignment_2/src/modules/home/bloc/home_bloc.dart';
import 'package:assignment_2/src/modules/login/bloc/login_bloc.dart';
import 'package:assignment_2/src/modules/login/ui/login_screen.dart';

import 'package:assignment_2/src/modules/verbersuggesties/bloc/user_bloc.dart';
import 'package:assignment_2/src/services/home_data_service.dart';
import 'package:assignment_2/src/services/user_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // bloc for Vebersuggestion page
        BlocProvider(create: (_) => UserBloc(UserService())),
        // bloc for login page
        BlocProvider(create: (_) => LoginBloc()),
        //bloc for home page
        BlocProvider(create: (_) => HomeBloc(HomeDataService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const HomePage(),
        home: const LoginScreen(),
        //home: const VerbeterSuggestiesScreen(),
      ),
    );
  }
}
