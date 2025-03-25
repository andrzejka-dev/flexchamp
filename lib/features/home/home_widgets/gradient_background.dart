import 'dart:math';

import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  
  const GradientBackground({
    super.key,
    required this.child,
  });
  
  @override
   Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 121, 93, 165),
                Color(0xFF9D7BCA), 
                Color(0xFFA77CB2), 
                Color(0xFFB683A8), 
                Color(0xFFE9A8A2),
              ],
              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
            ),
          ),
        ),
        
        CustomPaint(
          painter: StarryBackgroundPainter(),
          size: Size.infinite,
        ),
        
        child,
      ],
    );
  }
}

class StarryBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42); 
    final starPaint = Paint();
    
    for (int i = 0; i < 120; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 0.8 + 0.2; 
      

      final alphaValue = (random.nextDouble() * 0.4 + 0.05) * 255; 
      starPaint.color = Colors.white.withAlpha(alphaValue.toInt());
      canvas.drawCircle(Offset(x, y), radius, starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}