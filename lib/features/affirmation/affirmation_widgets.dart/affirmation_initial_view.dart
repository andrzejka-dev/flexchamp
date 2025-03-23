// lib/features/affirmation/widgets/affirmation_initial_view.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AffirmationInitialView extends StatelessWidget {
  final VoidCallback onGetInspired;

  const AffirmationInitialView({
    super.key,
    required this.onGetInspired,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          
          // Inspirational icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(38), // 0.15 opacity
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lightbulb_outline,
              color: Colors.white,
              size: 40,
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Heading text
          Text(
            'Get your daily dose of inspiration',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          Text(
            'Positive affirmations to brighten your day',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white.withAlpha(204), // 0.8 opacity
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 40),
          
          // Get inspired button
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white.withAlpha(38), // 0.15 opacity
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(26), // 0.1 opacity
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onGetInspired,
                borderRadius: BorderRadius.circular(32),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Get Inspired',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}