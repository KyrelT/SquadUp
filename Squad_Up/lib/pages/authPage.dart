import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:squad_up/pages/homeScreen.dart';
import 'package:squad_up/pages/loginScreen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //user is logged in
          if (snapshot.hasData){
            return homeScreen();
          }
          //user is not logged in
          else{
            return loginScreen();
          }
        },
      ),
    );
  }
}
