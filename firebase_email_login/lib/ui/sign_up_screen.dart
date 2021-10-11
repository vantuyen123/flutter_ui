import 'package:firebase_email_login/bloc/register/register_bloc.dart';
import 'package:firebase_email_login/constants/color_helper.dart';
import 'package:firebase_email_login/ui/sign_in_screen.dart';
import 'package:firebase_email_login/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class SignUpScreen extends StatelessWidget {
  late RegisterBloc registerBloc;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      backgroundColor: backgroundColorRegister,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterSucceed) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is RegisterFailed) {
                      return _buildError(state.message);
                    } else if (state is RegisterSucceed) {
                      _emailController.text = '';
                      _passwordController.text = '';
                      return Container();
                    }
                    return Container();
                  },
                ),
              ),
              Text('Fill in the Application form'),
              SizedBox(
                height: 10,
              ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        signUpButtonColor,
                      ),
                    ),
                    onPressed: () {
                      registerBloc.add(
                        SignUpButtonPressed(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                       );
                    },
                    child: Text('Sign Up'),
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
              Image.asset('assets/images/beet.png')
            ],
          ),
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
