// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AffirmationModel _$AffirmationModelFromJson(Map<String, dynamic> json) =>
    AffirmationModel(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$AffirmationModelToJson(AffirmationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
    };
