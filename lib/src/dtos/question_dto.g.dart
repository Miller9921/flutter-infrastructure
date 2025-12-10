// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
      id: json['id'] as String,
      statement: json['statement'] as String,
      type: json['type'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankId: json['bank_id'] as String?,
      options: (json['options'] as List<dynamic>)
          .map((e) => QuestionOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasRandomOrder: json['has_random_order'] as bool? ?? false,
      hasMultipleAnswers: json['has_multiple_answers'] as bool? ?? false,
      hasFeedbackEnabled: json['has_feedback_enabled'] as bool? ?? false,
      mediaUrl: json['media_url'] as String?,
      isEmbedded: json['is_embedded'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statement': instance.statement,
      'type': instance.type,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'bank_id': instance.bankId,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'has_random_order': instance.hasRandomOrder,
      'has_multiple_answers': instance.hasMultipleAnswers,
      'has_feedback_enabled': instance.hasFeedbackEnabled,
      'media_url': instance.mediaUrl,
      'is_embedded': instance.isEmbedded,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
