// lib/features/affirmation/services/palette_extractor.dart
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteExtractorService {
  /// Extracts color palette from an image URL
  /// Returns a list of [topColor, bottomColor] for a gradient
  static Future<List<Color>> extractColorsFromImage(String imageUrl) async {
    try {
      final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
        maximumColorCount: 10,
      );
      
      // Get dominant/vibrant colors for top and bottom of gradient
      final Color primaryColor = paletteGenerator.dominantColor?.color ?? 
                               paletteGenerator.darkVibrantColor?.color ?? 
                               const Color.fromARGB(255, 121, 93, 165);
      
      final Color secondaryColor = paletteGenerator.vibrantColor?.color ?? 
                                 paletteGenerator.mutedColor?.color ?? 
                                 const Color(0xFFE9A8A2);
      
      return [primaryColor, secondaryColor];
    } catch (e) {
      // Return default colors on error
      return [
        const Color(0xFF8563CF), // Default purple
        const Color(0xFFE390BA), // Default pink
      ];
    }
  }
}