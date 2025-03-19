import 'package:freezed_annotation/freezed_annotation.dart';

part 'figure_model.freezed.dart';
part 'figure_model.g.dart';

@freezed
class FigureModel with _$FigureModel {
  const factory FigureModel({
    required String title,
    String? figureIcon,
    String? id,
  }) = _FigureModel;

  factory FigureModel.fromJson(Map<String, dynamic> json) => _$FigureModelFromJson(json);
}


