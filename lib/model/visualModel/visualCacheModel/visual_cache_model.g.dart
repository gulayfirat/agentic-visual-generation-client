// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisualCacheModelAdapter extends TypeAdapter<VisualCacheModel> {
  @override
  final int typeId = 1;

  @override
  VisualCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisualCacheModel(
      id: fields[1] as String,
      imageBytes: (fields[2] as List?)?.cast<Uint8List?>(),
      createdAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, VisualCacheModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageBytes)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisualCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualCacheModel _$VisualCacheModelFromJson(Map<String, dynamic> json) =>
    VisualCacheModel(
      id: json['id'] as String,
      imageBytes: (json['imageBytes'] as List<dynamic>?)
          ?.map((e) => const Uint8ListConverter().fromJson(e as String?))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$VisualCacheModelToJson(VisualCacheModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageBytes':
          instance.imageBytes?.map(const Uint8ListConverter().toJson).toList(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
