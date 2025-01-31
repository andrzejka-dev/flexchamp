// class FigureModel {
//   final String name;
//   final String imageURL;
//   final String id;
//   final String user;

//   FigureModel({
//     required this.name,
//     required this.imageURL,
//     required this.id,
//     required this.user,
//   });
// }

class FigureModel {
  final String title;
  final String figureIcon;
  final String name;
  final String photoURL;

  FigureModel({
    required this.title,
    required this.figureIcon,
    required this.name,
    required this.photoURL,
  });

  factory FigureModel.fromJson(Map<String, dynamic> json) {
    return FigureModel(
      title: json['title'] ?? '',
      figureIcon: json['figureIcon'] ?? '',
      name: json['name'] ?? '',
      photoURL: json['photoURL'] ?? '',
    );
  }
}
