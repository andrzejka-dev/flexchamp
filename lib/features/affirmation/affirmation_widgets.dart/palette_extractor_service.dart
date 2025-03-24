import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteExtractorService {
 
  static Future<List<Color>> extractColorsFromImage(String imageUrl) async {
    try {
      final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
        maximumColorCount: 10,
      );
      
      final Color primaryColor = paletteGenerator.dominantColor?.color ?? 
                               paletteGenerator.darkVibrantColor?.color ?? 
                               const Color.fromARGB(255, 121, 93, 165);
      
      final Color secondaryColor = paletteGenerator.vibrantColor?.color ?? 
                                 paletteGenerator.mutedColor?.color ?? 
                                 const Color(0xFFE9A8A2);
      
      return [primaryColor, secondaryColor];
    } catch (e) {
    
      return [
        const Color(0xFF8563CF), 
        const Color(0xFFE390BA), 
      ];
    }
  }
}