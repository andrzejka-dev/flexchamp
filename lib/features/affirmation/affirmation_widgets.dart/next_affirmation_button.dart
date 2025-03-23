// lib/features/affirmation/widgets/next_affirmation_button.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextAffirmationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextAffirmationButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
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
          onTap: onPressed,
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
                  Icons.refresh_rounded,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                Text(
                  'Next Affirmation',
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
    );
  }
}