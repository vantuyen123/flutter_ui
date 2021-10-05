import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/blocs/auth_bloc.dart';
import 'package:flutter_firebase/home_facebook.dart';
import 'package:flutter_firebase/home_google.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late StreamSubscription<User?> loginStateSubscription;
  late StreamSubscription<User?> loginStateSubscriptionFacebook;


  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context,listen: false);

    loginStateSubscriptionFacebook = authBloc.currentUserFacebook.listen((event) {
      if(event != null){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeFacebookScreen())
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscriptionFacebook.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SignInButton(
              Buttons.Facebook,
              onPressed: () => authBloc.loginFacebook(),
            ),
          ),
        ],
      ),
    );
  }
}
