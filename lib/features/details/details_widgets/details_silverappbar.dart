import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:flutter/material.dart';

class DetailsSliverAppBar extends StatelessWidget {
  final DetailModel figure;

  const DetailsSliverAppBar({
    super.key,
    required this.figure,

  });

  @override
   Widget build(BuildContext context) {
    // Get the header image for this figure category
    final String headerImageUrl = figure.headerImage.isNotEmpty 
        ? figure.headerImage 
        : (figure.photoURLs.isNotEmpty ? figure.photoURLs.first : '');

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 180.0,
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        title: null,
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF7B63AA), // Purple at top
                    Color(0xFFA77CB2), // Mid purple
                  ],
                ),
              ),
            ),

            // Exercise-specific image
            if (headerImageUrl.isNotEmpty)
              Opacity(
                opacity: 0.9,
                child: headerImageUrl.startsWith('http') || headerImageUrl.startsWith('https')
                    // Network image if URL is from Firebase
                    ? Image.network(
                        headerImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: Colors.purple.withAlpha(53));
                        },
                      )
                    // Asset image if it's a local asset
                    : Image.asset(
                        headerImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: Colors.purple.withAlpha(53));
                        },
                      ),
              ),

            // Gradient overlay for smooth fade effect
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFFA77CB2), // Fade from bottom
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DetailsSliverAppBar extends StatelessWidget {
//   final DetailModel figure;
  
//   const DetailsSliverAppBar({
//     super.key,
//     required this.figure,
//   });
  
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       backgroundColor: Colors.transparent,
//       expandedHeight: 180.0,
//       floating: false,
//       pinned: true,
//       automaticallyImplyLeading: false,
//       flexibleSpace: FlexibleSpaceBar(
//         title: null,
//         background: figure.photoURLs.isNotEmpty
//             ? Image.network(
//                 figure.photoURLs.first,
//                 fit: BoxFit.cover,
//               )
//             : Container(color: Colors.purple.withAlpha(53)),
//       ),
//     );
//   }
// }