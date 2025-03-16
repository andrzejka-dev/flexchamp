import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  
  const GradientBackground({
    super.key,
    required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF9D7BCA), // Purple-lavender (top left)
            Color(0xFF7B6CB0), // Medium purple (center top)
            Color(0xFF8D72B8), // Medium purple-blue (center)
            Color(0xFFB683A8), // Pinkish purple (center bottom)
            Color(0xFFE9A8A2), // Light coral (bottom right)
          ],
          stops: [0.0, 0.3, 0.5, 0.7, 0.9],
        ),
      ),
      child: child,
    );
  }
}