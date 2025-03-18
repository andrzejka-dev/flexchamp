import 'package:json_annotation/json_annotation.dart';

part 'affirmation_model.g.dart';

@JsonSerializable()

class AffirmationModel {
  final int id;
  final String imageUrl;

  AffirmationModel({
    required this.id,
    required this.imageUrl,
  });

  factory AffirmationModel.fromJson(Map<String, dynamic> json) => _$AffirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AffirmationModelToJson(this);
}