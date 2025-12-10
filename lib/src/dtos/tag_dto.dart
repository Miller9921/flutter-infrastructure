import 'package:json_annotation/json_annotation.dart';

part 'tag_dto.g.dart';

@JsonSerializable()
class TagDto {
  final String id;
  final String name;
  @JsonKey(name: 'color')
  final String? color;

  const TagDto({
    required this.id,
    required this.name,
    this.color,
  });

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$TagDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          color == other.color;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;
}
