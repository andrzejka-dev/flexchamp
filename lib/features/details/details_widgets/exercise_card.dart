import 'package:flexchamp/domain/models/detail_model.dart';
import 'package:flexchamp/features/details/page/photo_mapping_util.dart';
import 'package:flexchamp/features/home/home_widgets/photo_gallery.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseDescription;
  final DetailModel figure;
  final String categoryTitle;
  
  const ExerciseCard({
    super.key,
    required this.exerciseName,
    required this.exerciseDescription,
    required this.figure,
    required this.categoryTitle,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(51),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExerciseTitle(name: exerciseName),
          ExercisePhotoGallery(
            figure: figure, 
            exerciseName: exerciseName, 
            categoryTitle: categoryTitle
          ),
          ExerciseDescription(description: exerciseDescription),
        ],
      ),
    );
  }
}

class ExerciseTitle extends StatelessWidget {
  final String name;
  
  const ExerciseTitle({
    super.key,
    required this.name,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ExercisePhotoGallery extends StatelessWidget {
  final DetailModel figure;
  final String exerciseName;
  final String categoryTitle;
  
  const ExercisePhotoGallery({
    super.key,
    required this.figure,
    required this.exerciseName,
    required this.categoryTitle,
  });
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(12),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: PhotoGallery(
          photoURLs: PhotoMappingUtil.getPhotoURLsForExercise(
            figure,
            exerciseName,
            categoryTitle,
          )
        ),
      ),
    );
  }
}

class ExerciseDescription extends StatelessWidget {
  final String description;
  
  const ExerciseDescription({
    super.key,
    required this.description,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}