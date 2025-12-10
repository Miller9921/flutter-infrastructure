// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionOptionDto _$QuestionOptionDtoFromJson(Map<String, dynamic> json) =>
    QuestionOptionDto(
      id: json['id'] as String,
      text: json['text'] as String,
      isCorrect: json['is_correct'] as bool,
      feedback: json['feedback'] as String?,
      imageUrl: json['image_url'] as String?,
      matchingPair: json['matching_pair'] as String?,
    );

Map<String, dynamic> _$QuestionOptionDtoToJson(QuestionOptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'is_correct': instance.isCorrect,
      'feedback': instance.feedback,
      'image_url': instance.imageUrl,
      'matching_pair': instance.matchingPair,
    };
