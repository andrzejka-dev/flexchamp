import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/domain/repositories/figure_repository.dart';
import 'package:flexchamp/features/admin/storage_update_screen.dart';
import 'package:flexchamp/features/affirmation/affirmation_page.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flexchamp/features/details/page/details_page.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/cubit/figure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            'Welcome to FlexChamp!',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
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
                icon:
                    const Icon(Icons.admin_panel_settings, color: Colors.white),
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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF9D7BCA), // Purple-lavender (top left)
                Color(0xFF7B6CB0), // Medium purple (center top)
                Color(0xFF8D72B8), // Medium purple-blue (center)
                Color(0xFFB683A8), // Pinkish purple (center bottom)
                Color(0xFFE9A8A2),
              ],
              stops: [0.0, 0.3, 0.5, 0.7, 0.9],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BlocBuilder<FigureCubit, FigureState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case Status.initial:
                          case Status.loading:
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
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
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.network(
                                        figureModel.figureIcon,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
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
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_circle_right,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AffirmationPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
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
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(51),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.grade,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daily Affirmations",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  "Get inspired whenever you need it",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(51),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Icon(
                              Icons.arrow_circle_right,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
