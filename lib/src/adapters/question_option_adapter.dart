import '../domain/entities/entities.dart';
import '../dtos/question_option_dto.dart';

/// Adapter to convert between QuestionOption entity and QuestionOptionDto
abstract class QuestionOptionAdapter {
  /// Converts a QuestionOptionDto to a QuestionOption entity
  static QuestionOption toEntity(QuestionOptionDto dto) {
    return QuestionOption(
      id: dto.id,
      text: dto.text,
      isCorrect: dto.isCorrect,
      feedback: dto.feedback,
      imageUrl: dto.imageUrl,
      matchingPair: dto.matchingPair,
    );
  }

  /// Converts a QuestionOption entity to a QuestionOptionDto
  static QuestionOptionDto toDto(QuestionOption entity) {
    return QuestionOptionDto(
      id: entity.id,
      text: entity.text,
      isCorrect: entity.isCorrect,
      feedback: entity.feedback,
      imageUrl: entity.imageUrl,
      matchingPair: entity.matchingPair,
    );
  }

  /// Converts a list of QuestionOptionDto to a list of QuestionOption entities
  static List<QuestionOption> toEntityList(List<QuestionOptionDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }

  /// Converts a list of QuestionOption entities to a list of QuestionOptionDto
  static List<QuestionOptionDto> toDtoList(List<QuestionOption> entities) {
    return entities.map((entity) => toDto(entity)).toList();
  }
}
