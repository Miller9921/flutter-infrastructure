import '../domain/entities/entities.dart';
import '../dtos/question_dto.dart';
import 'tag_adapter.dart';
import 'question_option_adapter.dart';

/// Adapter to convert between Question entity and QuestionDto
abstract class QuestionAdapter {
  /// Converts a QuestionDto to a Question entity
  static Question toEntity(QuestionDto dto) {
    return Question(
      id: dto.id,
      statement: dto.statement,
      type: QuestionTypeExtension.fromString(dto.type),
      tags: TagAdapter.toEntityList(dto.tags),
      bankId: dto.bankId,
      options: QuestionOptionAdapter.toEntityList(dto.options),
      hasRandomOrder: dto.hasRandomOrder,
      hasMultipleAnswers: dto.hasMultipleAnswers,
      hasFeedbackEnabled: dto.hasFeedbackEnabled,
      mediaUrl: dto.mediaUrl,
      isEmbedded: dto.isEmbedded,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  /// Converts a Question entity to a QuestionDto
  static QuestionDto toDto(Question entity) {
    return QuestionDto(
      id: entity.id,
      statement: entity.statement,
      type: entity.type.toStringValue(),
      tags: TagAdapter.toDtoList(entity.tags),
      bankId: entity.bankId,
      options: QuestionOptionAdapter.toDtoList(entity.options),
      hasRandomOrder: entity.hasRandomOrder,
      hasMultipleAnswers: entity.hasMultipleAnswers,
      hasFeedbackEnabled: entity.hasFeedbackEnabled,
      mediaUrl: entity.mediaUrl,
      isEmbedded: entity.isEmbedded,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts a list of QuestionDto to a list of Question entities
  static List<Question> toEntityList(List<QuestionDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }

  /// Converts a list of Question entities to a list of QuestionDto
  static List<QuestionDto> toDtoList(List<Question> entities) {
    return entities.map((entity) => toDto(entity)).toList();
  }
}
