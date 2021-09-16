import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_17/animation/fadeanimation.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FadeAnimation(
                        delay: 1,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                        delay: 1.2,
                        child: Text(
                          "Create an account, It's free",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        FadeAnimation(
                            delay: 1.2,
                            child: _buildInput(
                                label: "Email", hint: "Enter your email")),
                        FadeAnimation(
                          delay: 1.3,
                          child: _buildInput(
                              label: "Password",
                              obscureText: true,
                              hint: "Enter your password"),
                        ),
                        FadeAnimation(
                          delay: 1.4,
                          child: _buildInput(
                              label: "Confirm Password",
                              obscureText: true,
                              hint: "Enter your confirm password"),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black))),
                        child: MaterialButton(
                          onPressed: () {},
                          height: 60,
                          elevation: 0,
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          color: Colors.greenAccent,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                        ),
                        Text(
                          " Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({label, obscureText = false, hint}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            obscureText: obscureText,
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!))),
          ),
          SizedBox(
            height: 30,
          )
        ],
      );
}
