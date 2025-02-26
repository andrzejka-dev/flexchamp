import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/admin/storage_update_screen.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flexchamp/features/details/page/details_page.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  final User currentUser; 

  const HomePage({super.key, required this.currentUser});
  bool _isAdmin() {
    return true;
  }

  @override
    Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FigureCubit(FiguresRepository())..start(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.helloWorld,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            // Admin button - only appears for admin users
            if (_isAdmin())
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StorageUpdateScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.admin_panel_settings, color: Colors.white),
                tooltip: 'Admin Tools',
              ),
            // User profile button (existing)
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserProfileScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),

  //   Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => FigureCubit(FiguresRepository())..start(),
  //     child: Scaffold(
  //       backgroundColor: Colors.transparent,
  //       extendBodyBehindAppBar: true,
  //       appBar: AppBar(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         title: Text(
  //           AppLocalizations.of(context)!.helloWorld,
  //           style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //         ),
  //         actions: [
  //           IconButton(
  //             onPressed: () {
  //               Navigator.of(context).push(
  //                 MaterialPageRoute(
  //                   builder: (context) => const UserProfileScreen(),
  //                 ),
  //               );
  //             },
  //             icon: const Icon(Icons.person, color: Colors.white),
  //           ),
  //         ],
  //       ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF7B63AA), // Brighter purple at top
        Color(0xFFA77CB2), // Vibrant mid purple
        Color(0xFFD3A1B8), // Bright mauve/pink
        Color(0xFFFFB091),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<FigureCubit, FigureState>(
                builder: (context, state) {
                  switch (state.status) {
                    case Status.initial:
                    case Status.loading:
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    
                    case Status.success:
                      if (state.figures.isEmpty) {
                        return const Center(
                          child: Text(
                            'No figures found',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.figures.length,
                        itemBuilder: (context, index) {
                          final figureModel = state.figures[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(51),
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(51),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 12.0,
                              ),
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  figureModel.figureIcon,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade300,
                                      child: const Icon(Icons.person,
                                          color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                              title: Text(
                                figureModel.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                        title: figureModel.title,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(51),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    
                    case Status.error:
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(51),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text(
                            state.errorMessage ?? 'Unknown error',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


