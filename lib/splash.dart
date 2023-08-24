// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          "682048853438-lfh6pri97psdmsvo112gkftqoj07c3do.apps.googleusercontent.com");

  @override
  void initState() {
    checkSignInStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Welcome!",
            style: TextStyle(fontSize: 30),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  void checkSignInStatus() async {
    await Future.delayed(Duration(seconds: 2));
    bool isSignedIn = await googleSignIn.isSignedIn();
    if (isSignedIn) {
      print('user signed in');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
