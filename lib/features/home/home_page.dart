import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key, required this.currentUser});

  final User currentUser;

  final usersQuery = FirebaseFirestore.instance.collection('users').orderBy('displayName');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => const UserProfileScreen(),),);
          }, 
          icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: usersQuery.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final user = snapshot.data!.docs[index].data();
            return ListTile(
              title: Text('User name is ${user['displayName']}'),
            );
          },
        );
      },
    ),
    );
  }
}