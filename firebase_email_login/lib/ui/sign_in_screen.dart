import 'package:firebase_email_login/bloc/login/login_bloc.dart';
import 'package:firebase_email_login/constants/color_helper.dart';
import 'package:firebase_email_login/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class SignInScreen extends StatelessWidget {
  late LoginBloc signInBloc;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    signInBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: backgroundColorRegister ,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSucceed) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is LoginFailed) {
                    return _buildError(state.message);
                  } else if (state is LoginSucceed) {
                    return Container();
                  }
                  return Container();
                },
              ),
            ),

            Container(
               child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            signInButtonColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                        },
                        child: Text('Sign In'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            orButtonColor,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Or',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            signUpButtonColor,
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/beet.png')
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildError(String message) => Text(
    message,
    style: TextStyle(
      color: Colors.red,
    ),
  );
}
