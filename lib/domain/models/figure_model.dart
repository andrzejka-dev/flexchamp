class FigureModel {
    FigureModel({
    required this.title,
    required this.figureIcon,
  });

  final String title;
  final String figureIcon;
  



  factory FigureModel.fromJson(Map<String, dynamic> json) {
    return FigureModel(
      title: json['title'] ?? '',
      figureIcon: json['figureIcon'] ?? '',
    );
  }
}
