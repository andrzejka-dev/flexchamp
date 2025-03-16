import 'package:flutter/material.dart';

class DetailsGradientBackground extends StatelessWidget {
  final Widget child;
  
  const DetailsGradientBackground({
    super.key,
    required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7B63AA), // Brighter purple at top
            Color(0xFFA77CB2), // Vibrant mid purple
            Color(0xFFD3A1B8), // Bright mauve/pink
            Color(0xFFFFB091), // Lighter orange at bottom                
          ],
        ),
      ),
      child: child,
    );
  }
}