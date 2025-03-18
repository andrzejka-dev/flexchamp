// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      names: (json['name'] as List<dynamic>).map((e) => e as String).toList(),
      descriptions: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoURLs:
          (json['photoURL'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
      title: json['title'] as String,
      figureIcon: json['figureIcon'] as String,
      headerImage: json['headerImage'] as String,
    );

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'name': instance.names,
      'description': instance.descriptions,
      'photoURL': instance.photoURLs,
      'headerImage': instance.headerImage,
      'id': instance.id,
      'title': instance.title,
      'figureIcon': instance.figureIcon,
    };
