import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
          Center(
            child: ElevatedButton(
              onPressed: () {
                auth
                    .sendPasswordResetEmail(email: _email)
                    .then((_) => Navigator.of(context).pop());
              },
              child: Text('Send Request'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orangeAccent)),
            ),
          ),
        ],
      ),
    );
  }

}
