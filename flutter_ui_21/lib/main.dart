import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  late Timer _timer;
  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });
    const onSec = Duration(seconds: 1);
    _timer = new Timer.periodic(onSec, (timer) {
      if (_start == 0) {
        _start = 60;
        timer.cancel();
      } else {
        _start--;
      }
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const onSec = Duration(milliseconds: 10000);
    _timer = new Timer.periodic(onSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade200),
                padding: EdgeInsets.all(20),
                child: Transform.rotate(
                  angle: 38,
                  child: Image(
                    image: AssetImage('assets/images/email.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Please enter the 6 digit to sent \n +93 706-399-999',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              VerificationCode(
                length: 6,
                textStyle: TextStyle(fontSize: 20.sp),
                underlineColor: Colors.blueAccent,
                keyboardType: TextInputType.number,
                onEditing: (value) {},
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t resive the OTP',
                    style:
                        TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_isResendAgain) return;
                        resend();
                      },
                      child: Text(
                        _isResendAgain
                            ? "Try again in " + _start.toString()
                            : 'Resend',
                        style: TextStyle(color: Colors.blueAccent),
                      ))
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              MaterialButton(
                disabledColor: Colors.grey.shade300,
                onPressed: _code.length < 6
                    ? null
                    : () {
                        verify();
                      },
                color: Colors.black,
                minWidth: double.infinity,
                height: 50.h,
                child: _isLoading
                    ? Container(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 3,
                          color: Colors.black,
                        ),
                      )
                    : _isVerified
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 30,
                          )
                        : Text(
                            'Verify',
                            style: TextStyle(color: Colors.white),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
