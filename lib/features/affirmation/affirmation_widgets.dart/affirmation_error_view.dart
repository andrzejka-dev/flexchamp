import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AffirmationErrorView extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const AffirmationErrorView({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(38), 
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 40,
            ),
          ),
          
          const SizedBox(height: 24),

          Text(
            'Could not load affirmation',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          
          const SizedBox(height: 8),
          
          Text(
            errorMessage,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white.withAlpha(204),
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 32),
          
          // Try again button
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white.withAlpha(38), 
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onRetry,
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
                        'Try Again',
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