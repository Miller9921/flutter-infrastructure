import '../domain/entities/entities.dart';
import '../dtos/question_bank_dto.dart';

/// Adapter to convert between QuestionBank entity and QuestionBankDto
abstract class QuestionBankAdapter {
  /// Converts a QuestionBankDto to a QuestionBank entity
  static QuestionBank toEntity(QuestionBankDto dto) {
    return QuestionBank(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      questionIds: List<String>.from(dto.questionIds),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  /// Converts a QuestionBank entity to a QuestionBankDto
  static QuestionBankDto toDto(QuestionBank entity) {
    return QuestionBankDto(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      questionIds: List<String>.from(entity.questionIds),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts a list of QuestionBankDto to a list of QuestionBank entities
  static List<QuestionBank> toEntityList(List<QuestionBankDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }

  /// Converts a list of QuestionBank entities to a list of QuestionBankDto
  static List<QuestionBankDto> toDtoList(List<QuestionBank> entities) {
    return entities.map((entity) => toDto(entity)).toList();
  }
}
