import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 121, 93, 165), // This specific shade you marked with the arrow
                Color(0xFF9D7BCA), // Purple-lavender
                Color(0xFFA77CB2), // Mid purple
                Color(0xFFB683A8), // Pinkish purple
                Color(0xFFE9A8A2),
              ],
              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
            ),
          ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'About',
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "FlexChamp",
                        style: GoogleFonts.mulish(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Version 1.0.0",
                        style: GoogleFonts.mulish(
                          textStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(51),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "FlexChamp helps you improve your flexibility with guided exercises, stretches, and daily affirmations. Track your progress and achieve your flexibility goals!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}