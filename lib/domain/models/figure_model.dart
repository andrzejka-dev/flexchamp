class FigureModel {
  final String title;    // Changed from List<String> to String
  final String figureIcon;
  final String id;

  FigureModel({
    required this.title,
    required this.figureIcon,
    required this.id,
  });

  factory FigureModel.fromMap(Map<String, dynamic> map, String documentId) {
    return FigureModel(
      figureIcon: map['figureIcon'] ?? '',
      title: map['title'] ?? '',  // Now expecting a single String
      id: documentId,
    );
  }
}
