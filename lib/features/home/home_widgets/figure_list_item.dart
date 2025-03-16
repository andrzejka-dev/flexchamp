import 'package:flexchamp/domain/models/figure_model.dart';
import 'package:flexchamp/features/details/page/details_page.dart';
import 'package:flutter/material.dart';

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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        leading: FigureAvatar(imageUrl: figureModel.figureIcon),
        title: Text(
          figureModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        trailing: DetailsButton(title: figureModel.title),
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
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        imageUrl,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            child: const Icon(Icons.person, color: Colors.white),
          );
        },
      ),
    );
  }
}

class DetailsButton extends StatelessWidget {
  final String title;
  
  const DetailsButton({
    super.key,
    required this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: title,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(51),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(
          Icons.arrow_circle_right,
          color: Colors.white,
        ),
      ),
    );
  }
}