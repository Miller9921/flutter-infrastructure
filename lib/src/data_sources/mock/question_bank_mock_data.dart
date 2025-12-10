import '../../dtos/question_bank_dto.dart';

/// Mock data for question banks
class QuestionBankMockData {
  static final List<QuestionBankDto> items = [
    QuestionBankDto(
      id: 'B-2045',
      name: 'Examen Final de Matemáticas 2024',
      description: 'Preguntas para el examen final del curso',
      questionIds: const ['1030', '1035'],
      createdAt: DateTime(2023, 10, 15),
    ),
    QuestionBankDto(
      id: 'B-2046',
      name: 'Biología Celular - Unidad 1',
      description: 'Preguntas sobre células y organelos',
      questionIds: const ['1032'],
      createdAt: DateTime(2023, 10, 20),
    ),
    QuestionBankDto(
      id: 'B-2047',
      name: 'Historia del Arte Contemporáneo',
      description: null,
      questionIds: const [],
      createdAt: DateTime(2023, 11, 5),
    ),
    QuestionBankDto(
      id: 'B-2048',
      name: 'Química Orgánica - Laboratorio',
      description: 'Preguntas prácticas de laboratorio',
      questionIds: const ['1030'],
      createdAt: DateTime(2023, 11, 12),
    ),
  ];
}
