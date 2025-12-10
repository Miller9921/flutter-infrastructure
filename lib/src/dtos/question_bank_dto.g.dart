// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_bank_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionBankDto _$QuestionBankDtoFromJson(Map<String, dynamic> json) =>
    QuestionBankDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      questionIds: (json['question_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$QuestionBankDtoToJson(QuestionBankDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'question_ids': instance.questionIds,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
