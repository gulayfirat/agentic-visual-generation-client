// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualResponseModel _$VisualResponseModelFromJson(Map<String, dynamic> json) =>
    VisualResponseModel(
      id: json['id'] as String?,
      visualUrls: (json['visualUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$VisualResponseModelToJson(
        VisualResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'visualUrls': instance.visualUrls,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
