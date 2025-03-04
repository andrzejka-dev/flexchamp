class AffirmationModel {
  final int id;
  final String imageUrl;

  AffirmationModel({
    required this.id,
    required this.imageUrl,
  });

  factory AffirmationModel.fromJson(Map<String, dynamic> json) {
    return AffirmationModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
    );
  }
}