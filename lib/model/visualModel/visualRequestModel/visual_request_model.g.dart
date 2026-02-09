// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualRequestModel _$VisualRequestModelFromJson(Map<String, dynamic> json) =>
    VisualRequestModel(
      id: json['id'] as String?,
      imageDescription: json['imageDescription'] as String?,
      isAddText: json['isAddText'] as bool?,
      text: json['text'] as String?,
      postType: json['postType'] as String?,
      postMood: json['postMood'] as String?,
      colorTone: json['colorTone'] as String?,
      textStyle: json['textStyle'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$VisualRequestModelToJson(VisualRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageDescription': instance.imageDescription,
      'isAddText': instance.isAddText,
      'text': instance.text,
      'postType': instance.postType,
      'postMood': instance.postMood,
      'colorTone': instance.colorTone,
      'textStyle': instance.textStyle,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
