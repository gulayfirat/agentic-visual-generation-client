import 'package:json_annotation/json_annotation.dart';
import 'package:postgen_app/core/base/base_model.dart';
part 'visual_response_model.g.dart';

@JsonSerializable()
class VisualResponseModel extends BaseModel {
  final String? id;
  final List<String>? visualUrls;
  final DateTime? createdAt;
  VisualResponseModel({
    this.id,
    this.visualUrls,
    this.createdAt,
  });
  @override
  VisualResponseModel fromJson(Map<String, dynamic> json) =>
      _$VisualResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$VisualResponseModelToJson(this);
}
