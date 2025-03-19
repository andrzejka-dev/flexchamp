import 'package:freezed_annotation/freezed_annotation.dart';

part 'affirmation_model.freezed.dart';
part 'affirmation_model.g.dart';

@freezed
class AffirmationModel with _$AffirmationModel {
  const factory AffirmationModel({
    required int id,
    required String imageUrl,
  }) = _AffirmationModel;

  factory AffirmationModel.fromJson(Map<String, dynamic> json) => _$AffirmationModelFromJson(json);
}