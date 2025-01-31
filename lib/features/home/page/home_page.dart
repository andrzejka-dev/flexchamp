import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {

  final User currentUser; 

  const HomePage({super.key, required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => FigureCubit(FirebaseFirestore.instance)..start(),
    child: Scaffold(
    //return Scaffold(
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
       body: BlocBuilder<FigureCubit, FigureState>(
        builder: (context, state) {
          if (state is FigureLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state is FigureError) {
            return Center(child: Text(state.message));
          }
          
          if (state is FigureLoaded) {
            return Column(
              children: [
                ListView.builder(
                  itemCount: state.figure.length,
                  itemBuilder: (context, index) {
                    final figure = state.figure[index];
                    return ListTile(
                      tileColor: Color(0xFF9DAF9B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      leading: Text(figure.figureIcon, style: TextStyle(fontSize: 24),), // Display icon
                      title: Text(figure.title),
                      trailing: Icon(Icons.arrow_forward, color: Colors.white),
                    );
                  },
                ),
              ],
            );
          }
          
          return const Center(child: Text('No figures found'));
        },
      ),
    ),);
  }
}
//          body: BlocProvider(
//   create: (context) => HomeCubit()..start(),
//   child: BlocBuilder<HomeCubit, HomeState>(
//     builder: (context, state) {
//       if (state.errorMessage.isNotEmpty) {
//         return Text('Something went wrong: ${state.errorMessage}');
//       }

//       if (!state.isLoading) {
//         return const Center(child: CircularProgressIndicator());
//       }

//       return Center(
//         child: Text('User name is ${currentUser.displayName}'),
//       );
//     },
//   ),
// )
      
//     );
//   }
// }
