import 'package:flutter/material.dart';
import 'package:flutter_ui_18/login_page.dart';
import 'package:flutter_ui_18/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
