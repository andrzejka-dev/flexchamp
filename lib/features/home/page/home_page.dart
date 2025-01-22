import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flexchamp/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.currentUser});

  final User currentUser;

  final usersQuery =
      FirebaseFirestore.instance.collection('users').orderBy('displayName');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfileScreen(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
         body: BlocProvider(
  create: (context) => HomeCubit()..start(),
  child: BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      if (state.errorMessage.isNotEmpty) {
        return Text('Something went wrong: ${state.errorMessage}');
      }

      if (!state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return Center(
        child: Text('User name is ${currentUser.displayName}'),
      );
    },
  ),
)
      // body: BlocProvider(
      //   create: (context) => HomeCubit()..start(),
      //   child: BlocBuilder<HomeCubit, HomeState>(
      //     builder: (context, state) {
      //       return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      //         stream: usersQuery.snapshots(),
      //         builder: (context, snapshot) {
      //           if (state.errorMessage.isNotEmpty) {
      //             return Text('Something went wrong: ${state.errorMessage}',);
      //           }

      //           if (state.isLoading) {
      //             return const CircularProgressIndicator();
      //           }

      //           return ListView.builder(
      //             itemCount: snapshot.data?.docs.length,
      //             itemBuilder: (context, index) {
      //               final user = state.user[index].data();
      //               return ListTile(
      //                 title: Text('User name is ${user['displayName']}'),
      //               );
      //             },
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
