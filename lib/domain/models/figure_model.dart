import 'package:json_annotation/json_annotation.dart';

part 'figure_model.g.dart';

@JsonSerializable()
class FigureModel {
  final String title;    // Changed from List<String> to String
  final String figureIcon;
  final String id;

  FigureModel({
    required this.title,
    required this.figureIcon,
    required this.id,
  });

  factory FigureModel.fromJson(Map<String, dynamic> json) => _$FigureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FigureModelToJson(this);
}
