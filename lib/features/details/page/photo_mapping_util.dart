class PhotoMappingUtil {
  static Map<String, Map<String, List<int>>> exercisePhotoMapping = {
    "middle split": {
      "Hip rotation": [0, 1, 2],
      "Side lean": [3, 4],
      "Grand plié": [5, 6],
      "Supine side splits": [7, 8],
      "Hip open": [9, 10],
    },
    "bridge": {
      "Roll-out": [0, 1],
      "Glute bridge": [2, 3],
      "Forward bend": [4, 5],
      "Shoulder swings": [6, 7],
      "Cobra": [8, 9, 10],
    },
    "split": {
      "Bend forward": [0, 1, 2],
      "Cobra": [3, 4],
      "Pre-split transitions": [5, 6, 7],
    }
  };

  static List<String> getPhotoURLsForExercise(dynamic figure, String exerciseName, String documentTitle) {
    String normalizedTitle = documentTitle.toLowerCase();
    
    // Check if we have mapping for this document/category
    if (exercisePhotoMapping.containsKey(normalizedTitle) && 
        exercisePhotoMapping[normalizedTitle]!.containsKey(exerciseName)) {
      
      // Get the specific photo indices for this exercise
      List<int> photoIndices = exercisePhotoMapping[normalizedTitle]![exerciseName]!;
      List<String> photos = [];
      
      // Retrieve the actual photos by index
      for (int index in photoIndices) {
        if (index < figure.photoURLs.length) {
          photos.add(figure.photoURLs[index]);
        }
      }
      
      return photos;
    }
    
    // If no specific mapping found, return a default photo
    if (figure.photoURLs.isNotEmpty) {
      return [figure.photoURLs[0]];
    }
    
    return [];
  }
}