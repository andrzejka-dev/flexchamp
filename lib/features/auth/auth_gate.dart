import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flexchamp/features/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;


class AuthGate extends StatelessWidget {
  const AuthGate ({super.key});

@override
Widget build(BuildContext context) {
  return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    //if the user is already signed-in, use it as initial data
    initialData: FirebaseAuth.instance.currentUser,
    builder:(context, snapshot) {
      //user is not signed in
      if (!snapshot.hasData) {
      return SignInScreen(
      providers: [
      EmailAuthProvider(),
      ], 
    );} //SignInScreen


    //Render your application if authenticated
    return HomePage(
      currentUser: snapshot.data!,);
    },
    );
    }
    }