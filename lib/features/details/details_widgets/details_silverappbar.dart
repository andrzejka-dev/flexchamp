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
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF7B63AA),
                    Color(0xFFA77CB2),
                  ],
                ),
              ),
            ),
            if (headerImageUrl.isNotEmpty)
              Opacity(
                opacity: 0.9,
                child: headerImageUrl.startsWith('http') ||
                        headerImageUrl.startsWith('https')
                    ? Image.network(
                        headerImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: Colors.purple.withAlpha(53));
                        },
                      )
                    : Image.asset(
                        headerImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: Colors.purple.withAlpha(53));
                        },
                      ),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFF9D7BCA),
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
