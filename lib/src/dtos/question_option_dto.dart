import 'package:json_annotation/json_annotation.dart';

part 'question_option_dto.g.dart';

@JsonSerializable()
class QuestionOptionDto {
  final String id;
  final String text;
  @JsonKey(name: 'is_correct')
  final bool isCorrect;
  final String? feedback;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'matching_pair')
  final String? matchingPair;

  const QuestionOptionDto({
    required this.id,
    required this.text,
    required this.isCorrect,
    this.feedback,
    this.imageUrl,
    this.matchingPair,
  });

  factory QuestionOptionDto.fromJson(Map<String, dynamic> json) => 
      _$QuestionOptionDtoFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuestionOptionDtoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionOptionDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          isCorrect == other.isCorrect &&
          feedback == other.feedback &&
          imageUrl == other.imageUrl &&
          matchingPair == other.matchingPair;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      isCorrect.hashCode ^
      feedback.hashCode ^
      imageUrl.hashCode ^
      matchingPair.hashCode;
}
