import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final int opacity;

  const InfoContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 20,
    this.opacity = 51,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(opacity),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}