// lib/features/affirmation/widgets/affirmation_loading_view.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AffirmationLoadingView extends StatelessWidget {
  const AffirmationLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          'Loading your affirmation...',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}