import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:flexchamp/features/details/page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FigureListItem extends StatelessWidget {
  final FigureModel figureModel;
  
  const FigureListItem({
    super.key,
    required this.figureModel,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(51),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(51),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  title: figureModel.title,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Row(
              children: [
                // Larger avatar
                FigureAvatar(imageUrl: figureModel.figureIcon ?? 'default_image_path.png'),
                
                const SizedBox(width: 20), // Add spacing between avatar and text
                
                // Title with expanded to take available space
                  Expanded(
                  child: Text(
                    figureModel.title,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
                
                // Arrow icon
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(51),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Icon(
                    Icons.arrow_circle_right,
                    color: Colors.white,
                    size: 36,
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

class FigureAvatar extends StatelessWidget {
  final String imageUrl;
  
  const FigureAvatar({
    super.key,
    required this.imageUrl,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Increased from 40
      height: 60, // Increased from 40
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withAlpha(51), // Added background for better visibility
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        imageUrl,
        width: 70, // Increased from 40
        height: 70, // Increased from 40
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 40, // Increased icon size for error state
            ),
          );
        },
      ),
    );
  }
}