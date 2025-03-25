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
    initialData: FirebaseAuth.instance.currentUser,
    builder:(context, snapshot) {
      if (!snapshot.hasData) {
      return SignInScreen(
      providers: [
      EmailAuthProvider(),
      ], 
       headerBuilder: (context, constraints, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: Image.asset(
                  'images/flexchamp_login.png', 
                  width: 200,
                  height: 200,
                ),
              );
            },
          );
        }

    return HomePage(
      currentUser: snapshot.data!,);
    },
    );
    }
    }