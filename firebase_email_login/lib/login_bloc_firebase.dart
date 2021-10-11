import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_login/bloc/register/register_bloc.dart';
import 'package:firebase_email_login/repositories/user_repositories.dart';
import 'package:firebase_email_login/ui/home_screen.dart';
import 'package:firebase_email_login/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/login/login_bloc.dart';

class MyApp extends StatelessWidget {
  late UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    userRepository = UserRepository(firebaseAuth: FirebaseAuth.instance);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(userRepository: userRepository)..add(AppLoaded(),)),
        BlocProvider(create: (context) => RegisterBloc(userRepository: userRepository)),
        BlocProvider(create: (context) => LoginBloc(userRepository: userRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is UnAuthenticateState) {
          return SplashScreen();
        } else if (state is AuthenticateState) {
          return HomeScreen();
        }
        return Container();
      },
    );
  }
}
