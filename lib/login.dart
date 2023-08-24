import 'package:flutter/material.dart';
import 'package:flutter_application_1/parameters.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAuthorized = false;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
          'email',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      serverClientId:
          "682048853438-lfh6pri97psdmsvo112gkftqoj07c3do.apps.googleusercontent.com");
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _isAuthorized?Text("authed"):Text("not auth"),
          const Text(
            "Sign in with Google!",
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              startSignIn(context);
            }, 
            child: const Text('Sign in'))
        ],
      ),
    );
  }
  
  void startSignIn(context) async{
    await googleSignIn.signOut(); //optional
    GoogleSignInAccount? user = await googleSignIn.signIn();
    if (user == null) {
      _isAuthorized = false;
    } else {
      _isAuthorized = true;
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ParametersPage()));
    }
  }
}
