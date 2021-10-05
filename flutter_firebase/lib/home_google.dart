// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/blocs/auth_bloc.dart';
// import 'package:flutter_firebase/login_screen.dart';
// import 'package:flutter_signin_button/button_list.dart';
// import 'package:flutter_signin_button/button_view.dart';
// import 'package:provider/provider.dart';
//
// class HomeGoogleScreen extends StatefulWidget {
//   @override
//   _HomeGoogleScreenState createState() => _HomeGoogleScreenState();
// }
//
// class _HomeGoogleScreenState extends State<HomeGoogleScreen> {
//
//   late StreamSubscription<User?> loginStateSubscription;
//
//   // void initState() {
//   //   var authBloc = Provider.of<AuthBloc>(context, listen: false);
//   //   loginStateSubscription = authBloc.currentUserGoogle.listen((event) {
//   //     if (event == null) {
//   //       Navigator.of(context).pushReplacement(
//   //           MaterialPageRoute(builder: (context) => LoginScreen()));
//   //     }
//   //   });
//   //   super.initState();
//   // }
//
//   // @override
//   // void dispose() {
//   //   loginStateSubscription.cancel();
//   //   super.dispose();
//   // }
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   final authBloc = Provider.of<AuthBloc>(context);
//   //   return Scaffold(
//   //     body: Center(
//   //       child: StreamBuilder<User?>(
//   //         stream: authBloc.currentUserGoogle,
//   //         builder: (context, snapshot) {
//   //           if(!snapshot.hasData) return CircularProgressIndicator();
//   //           return Column(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             children: [
//   //               Text(
//   //                 snapshot.data!.displayName.toString(),
//   //                 style: TextStyle(fontSize: 35),
//   //               ),
//   //               SizedBox(
//   //                 height: 20,
//   //               ),
//   //               CircleAvatar(
//   //                 radius: 60.0,
//   //                 backgroundImage: NetworkImage(snapshot.data?.photoURL.toString().replaceFirst('s96', 's400') ??
//   //                 'https://c4.wallpaperflare.com/wallpaper/911/116/995/anime-tatoo-girl-illustration-wallpaper-preview.jpg'),
//   //               ),
//   //               SizedBox(height: 100),
//   //               SignInButton(
//   //                 Buttons.Google,
//   //                 text: 'Sign Out of Google',
//   //                 onPressed: () => authBloc.logoutGoogle(),
//   //               )
//   //             ],
//   //           );
//   //         }
//   //       ),
//   //     ),
//   //   );
//   // }
// }
