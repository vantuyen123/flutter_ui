import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_login/app/screens/reset_password.dart';
import 'package:firebase_email_login/app/screens/verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                  print(_email);
                });
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                  print(_password);
                });
              },
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => _signIn(_email,_password),
                child: Text('Sign In'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent)),
              ),
              ElevatedButton(onPressed: () => _signUp(_email,_password), child: Text('Sign Up')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResetPassword())),
                  child: Text('Forgot Password ?'))
            ],
          )
        ],
      ),
    );
  }

  _signIn(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message.toString(),
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
  _signUp(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: _email, password: _password);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message.toString(),
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
