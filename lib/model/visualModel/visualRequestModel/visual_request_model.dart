import 'package:json_annotation/json_annotation.dart';
import 'package:postgen_app/core/base/base_model.dart';
part 'visual_request_model.g.dart';

@JsonSerializable()
class VisualRequestModel extends BaseModel {
  final String? id;
  final String? imageDescription;
  final bool? isAddText;
  final String? text;
  final String? postType;
  final String? postMood;
  final String? colorTone;
  final String? textStyle;
  final DateTime? createdAt;
  VisualRequestModel({
    this.id,
    this.imageDescription,
    this.isAddText,
    this.text,
    this.postType,
    this.postMood,
    this.colorTone,
    this.textStyle,
    this.createdAt,
  });
  @override
  VisualRequestModel fromJson(Map<String, dynamic> json) =>
      _$VisualRequestModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$VisualRequestModelToJson(this);
}
