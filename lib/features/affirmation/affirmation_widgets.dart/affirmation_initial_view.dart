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
          
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(38), 
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lightbulb_outline,
              color: Colors.white,
              size: 40,
            ),
          ),
          
          const SizedBox(height: 24),
          
          Text(
            'Get your dose of inspiration',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 8),
          
          Text(
            '...to keep you on the right track',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.white.withAlpha(204), 
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 40),
          
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white.withAlpha(38), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(26), 
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