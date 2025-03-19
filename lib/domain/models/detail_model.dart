import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_model.freezed.dart';
part 'detail_model.g.dart';

@freezed
class DetailModel with _$DetailModel {
  const factory DetailModel({
    @JsonKey(name: 'name') required List<String> names,
    @JsonKey(name: 'description') required List<String> descriptions,
    @JsonKey(name: 'photoURL') required List<String> photoURLs,
    @JsonKey(name: 'headerImage') required String headerImage,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'figureIcon') required String figureIcon,
  }) = _DetailModel;

  factory DetailModel.fromJson(Map<String, dynamic> json) => _$DetailModelFromJson(json);
}