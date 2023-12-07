import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_app/pages/chathome.dart';
import 'package:sih_app/utils/loginOrRegister.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user logged in or not
            if (snapshot.hasData) {
              return const ChatHomePage();
            } else {
              return const LoginOrRegister();//Loginpage
            }
          }),
    );
  }
}
