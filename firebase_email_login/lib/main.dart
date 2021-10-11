import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_email_login/login_bloc_firebase.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



