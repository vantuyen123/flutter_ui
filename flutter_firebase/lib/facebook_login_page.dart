import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/facebook_login_controller.dart';
import 'package:flutter_firebase/google_login_controller.dart';
import 'package:provider/provider.dart';

class FacebookLoginPage extends StatefulWidget {
  @override
  _FacebookLoginPageState createState() => _FacebookLoginPageState();
}

class _FacebookLoginPageState extends State<FacebookLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Login'),
        backgroundColor: Colors.redAccent,
      ),
      body: loginUI(),
    );
  }

  loginUI() {
    return Consumer<FacebookSignInController>(
      builder: (context, model, child) {
        if (model.userData != null) {
          return Center(child: loggedInUI(model));
        } else {
          return loginControls(context);
        }
      },
    );
  }

  loggedInUI(FacebookSignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CircleAvatar(
        //   backgroundImage:
        //   Image.network(model.googleAccount!.photoUrl ?? '').image,
        //   radius: 50,
        // ),
        Text(model.userData!["name"] ?? ''),
        Text(model.userData!["email"]),
        ActionChip(
            label: Text("Logout"),
            onPressed: () {
              Provider.of<FacebookSignInController>(context, listen: false)
                  .logOut();
            }),
      ],
    );
  }

  loginControls(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<FacebookSignInController>(context, listen: false)
                  .login();
            },
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Facebook_Logo.png',
                      width: 45,
                      height: 45,
                    ),
                    Text(' Login with Facebook')
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Provider.of<GoogleSignInController>(context, listen: false)
                  .login();
            },
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Google_Logo.png',
                    width: 50,
                    height: 50,
                  ),
                  Text('Login with Facebook')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
