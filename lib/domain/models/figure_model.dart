class FigureModel {
  final List<String> title;
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
      title: List<String>.from(map['title'] ?? []),
      id: documentId,
    );
  }
}
