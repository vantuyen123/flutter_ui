import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer time;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    time =Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
       time.cancel();
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    }
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('An Email has been sent to ${user.email} please verify',
          textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
