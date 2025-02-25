class DetailModel {
  final List<String> names;
  final List<String> descriptions;
  final List<String> photoURLs;
  final String id;
  final String title;
  final String figureIcon;

  DetailModel({
    required this.names,
    required this.descriptions,
    required this.photoURLs,
    required this.id,
    required this.title,
    required this.figureIcon,
  });

  factory DetailModel.fromMap(Map<String, dynamic> map, String id) {
    return DetailModel(
      id: id,
      names: List<String>.from(map['name'] ?? []),
      descriptions: map['description'] ?? '',
      photoURLs: List<String>.from(map['photoURL'] ?? []),
      title: map['title'] ?? '',
      figureIcon: map['figureIcon'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': names,
      'description': descriptions,
      'photoURL': photoURLs,
      'title': title,
      'figureIcon': figureIcon,
    };
  }
}