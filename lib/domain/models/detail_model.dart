import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

@JsonSerializable()

class DetailModel {

  @JsonKey(name: 'name')
  final List<String> names;

  @JsonKey(name: 'description')
  final List<String> descriptions;

  @JsonKey(name: 'photoURL')
  final List<String> photoURLs;
  
  @JsonKey(name: 'headerImage')
  final String headerImage;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'figureIcon')
  final String figureIcon;

  DetailModel({
    required this.names,
    required this.descriptions,
    required this.photoURLs,
    required this.id,
    required this.title,
    required this.figureIcon,
    required this.headerImage
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => _$DetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);

  // factory DetailModel.fromMap(Map<String, dynamic> map, String id) {
  //   return DetailModel(
  //     id: id,
  //     names: List<String>.from(map['name'] ?? []),
  //     descriptions: List<String>.from(map['description'] ?? []),
  //     photoURLs: List<String>.from(map['photoURL'] ?? []),
  //     title: map['title'] ?? '',
  //     figureIcon: map['figureIcon'] ?? '',
  //     headerImage: map['headerImage'] ?? ''
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': names,
  //     'description': descriptions,
  //     'photoURL': photoURLs,
  //     'title': title,
  //     'figureIcon': figureIcon,
  //     'headerImage': headerImage
  //   };
  // }
}