import 'package:json_annotation/json_annotation.dart';

part 'question_bank_dto.g.dart';

@JsonSerializable()
class QuestionBankDto {
  final String id;
  final String name;
  final String? description;
  @JsonKey(name: 'question_ids')
  final List<String> questionIds;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const QuestionBankDto({
    required this.id,
    required this.name,
    this.description,
    required this.questionIds,
    required this.createdAt,
    this.updatedAt,
  });

  factory QuestionBankDto.fromJson(Map<String, dynamic> json) => 
      _$QuestionBankDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuestionBankDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionBankDto &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
