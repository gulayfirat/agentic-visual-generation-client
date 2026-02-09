// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/base_model.dart';
import '../../../product/constant/hive_constant.dart';
part 'visual_cache_model.g.dart';

@HiveType(typeId: HiveConstants.visualCacheModelTypeId)
@JsonSerializable()
class VisualCacheModel extends BaseModel {
  @HiveField(1)
  final String id;
  @Uint8ListConverter()
  @HiveField(2)
  final List<Uint8List?>? imageBytes;
  @HiveField(3)
  final DateTime? createdAt;

  VisualCacheModel({
    required this.id,
    this.imageBytes,
    this.createdAt,
  });

  @override
  VisualCacheModel fromJson(Map<String, dynamic> json) =>
      _$VisualCacheModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$VisualCacheModelToJson(this);
}

class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) {
    return json == null ? null : base64Decode(json);
  }

  @override
  String? toJson(Uint8List? object) {
    return object == null ? null : base64Encode(object);
  }
}
