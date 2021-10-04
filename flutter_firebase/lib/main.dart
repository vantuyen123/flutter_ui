import 'package:flutter/material.dart';
import 'package:flutter_firebase/facebook_login_controller.dart';
import 'package:flutter_firebase/facebook_login_page.dart';
import 'package:flutter_firebase/google_login_controller.dart';
import 'package:flutter_firebase/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInController(),
          child: LoginPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => FacebookSignInController(),
          child: FacebookLoginPage(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FacebookLoginPage(),
      ),
    );
  }
}
