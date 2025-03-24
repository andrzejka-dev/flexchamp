import 'package:flexchamp/app/core/enums.dart';
import 'package:flexchamp/features/affirmation/affirmation_widgets.dart/affirmation_page_widgets_extract.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_cubit.dart';
import 'package:flexchamp/features/affirmation/cubit/affirmation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AffirmationPage extends StatelessWidget {
  const AffirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Affirmations',
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AffirmationCubit, AffirmationState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: state.gradientColors,
              stops: state.gradientStops,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: switch (state.status) {
                Status.loading => const AffirmationLoadingView(),
                Status.success when state.affirmation != null => _buildSuccessContent(context, state),
                Status.error => AffirmationErrorView(
                  errorMessage: state.errorMessage,
                  onRetry: () => context.read<AffirmationCubit>().fetchRandomAffirmation(),
                ),
                _ => AffirmationInitialView(
                  onGetInspired: () => context.read<AffirmationCubit>().fetchRandomAffirmation(),
                ),
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSuccessContent(BuildContext context, AffirmationState state) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          
          AffirmationImageView(
            imageUrl: state.affirmation!.imageUrl,
            width: screenWidth * 0.85,
            height: screenHeight * 0.65,
          ),
          
          const Spacer(),
          
          NextAffirmationButton(
            onPressed: () => context.read<AffirmationCubit>().fetchRandomAffirmation(),
          ),
        ],
      ),
    );
  }
}