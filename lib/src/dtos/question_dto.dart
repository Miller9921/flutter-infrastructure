import 'package:json_annotation/json_annotation.dart';
import 'tag_dto.dart';
import 'question_option_dto.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  final String id;
  final String statement;
  final String type; // String for JSON, converted to enum in adapter
  final List<TagDto> tags;
  @JsonKey(name: 'bank_id')
  final String? bankId;
  final List<QuestionOptionDto> options;
  @JsonKey(name: 'has_random_order')
  final bool hasRandomOrder;
  @JsonKey(name: 'has_multiple_answers')
  final bool hasMultipleAnswers;
  @JsonKey(name: 'has_feedback_enabled')
  final bool hasFeedbackEnabled;
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @JsonKey(name: 'is_embedded')
  final bool isEmbedded;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const QuestionDto({
    required this.id,
    required this.statement,
    required this.type,
    required this.tags,
    this.bankId,
    required this.options,
    this.hasRandomOrder = false,
    this.hasMultipleAnswers = false,
    this.hasFeedbackEnabled = false,
    this.mediaUrl,
    this.isEmbedded = false,
    required this.createdAt,
    this.updatedAt,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) => 
      _$QuestionDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionDto &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
