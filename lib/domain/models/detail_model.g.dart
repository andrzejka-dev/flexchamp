// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailModelImpl _$$DetailModelImplFromJson(Map<String, dynamic> json) =>
    _$DetailModelImpl(
      names: (json['name'] as List<dynamic>).map((e) => e as String).toList(),
      descriptions: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoURLs:
          (json['photoURL'] as List<dynamic>).map((e) => e as String).toList(),
      headerImage: json['headerImage'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      figureIcon: json['figureIcon'] as String,
    );

Map<String, dynamic> _$$DetailModelImplToJson(_$DetailModelImpl instance) =>
    <String, dynamic>{
      'name': instance.names,
      'description': instance.descriptions,
      'photoURL': instance.photoURLs,
      'headerImage': instance.headerImage,
      'id': instance.id,
      'title': instance.title,
      'figureIcon': instance.figureIcon,
    };
