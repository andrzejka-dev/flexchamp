import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flexchamp/features/details/details_page.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  final User currentUser; 

  const HomePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FigureCubit(FiguresRepository())..start(),
      child: Scaffold(
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
            if (state.loadingErrorOccurred) {
              return const Center(child: Text('Error loading figures'));
            }

            if (state.figures.isEmpty) {
              return const Center(child: Text('No figures found'));
            }

            return ListView.builder(
              itemCount: state.figures.length,
              itemBuilder: (context, index) {
                final figureModel = state.figures[index];
                return ListTile(
                  tileColor: const Color(0xFF9DAF9B),
                  leading: Text(
                    figureModel.figureIcon,
                    style: const TextStyle(fontSize: 24),
                  ),
                  title: Text(figureModel.title),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(figureType: figureModel.title.toLowerCase(),), // Replace NextScreen with your actual screen widget
            ),
          );
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),)
                );
              },
            );
          },
        ),
      ),
    );
  }
}

