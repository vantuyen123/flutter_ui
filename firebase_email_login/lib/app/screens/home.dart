import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_login/app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Home Screen',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
