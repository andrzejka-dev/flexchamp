import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexchamp/app/core/injection_container.dart';
import 'package:flexchamp/features/about/page/about_page.dart';
import 'package:flexchamp/features/auth/user_profile.dart';
import 'package:flexchamp/features/home/cubit/figure_cubit.dart';
import 'package:flexchamp/features/home/home_widgets/home_page_widgets_extract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final User currentUser;

  const HomePage({super.key, required this.currentUser});
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FigureCubit>()..start(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: HomeAppBar(),
        body: GradientBackground(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Text(
                    "What's your goal today?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FigureListView(),
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
                  child: DailyAffirmationCard(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentUser: currentUser,
          currentIndex: 0,
          onProfileTap: (_) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(),
              ),
            );
          },
          onAboutTap: (_) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AboutPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

