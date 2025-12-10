import 'package:test/test.dart';
import 'package:infrastructure/infrastructure.dart';

void main() {
  group('Tag Tests', () {
    late TagLocalDataSource dataSource;
    late TagRepository repository;

    setUp(() {
      dataSource = TagLocalDataSourceImpl();
      repository = TagRepositoryImpl(localDataSource: dataSource);
    });

    test('should get all tags', () async {
      final result = await repository.getAll();
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (tags) {
          expect(tags.length, 8);
          expect(tags.first.name, 'Química');
          expect(tags.first.color, '#10B981');
        },
      );
    });

    test('should get tag by id', () async {
      final result = await repository.getById('1');
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (tag) {
          expect(tag.id, '1');
          expect(tag.name, 'Química');
        },
      );
    });

    test('should return NotFoundFailure for non-existent tag', () async {
      final result = await repository.getById('999');
      
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<NotFoundFailure>()),
        (tag) => fail('Expected failure but got success'),
      );
    });

    test('should search tags by name', () async {
      final result = await repository.search('Bio');
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (tags) {
          expect(tags.length, 1);
          expect(tags.first.name, 'Biología');
        },
      );
    });

    test('should create a new tag', () async {
      const newTag = Tag(
        id: '',
        name: 'Física',
        color: '#FF5733',
      );

      final result = await repository.create(newTag);
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (tag) {
          expect(tag.name, 'Física');
          expect(tag.color, '#FF5733');
          expect(tag.id.isNotEmpty, true);
        },
      );
    });
  });

  group('Question Tests', () {
    late QuestionLocalDataSource dataSource;
    late QuestionRepository repository;

    setUp(() {
      dataSource = QuestionLocalDataSourceImpl();
      repository = QuestionRepositoryImpl(localDataSource: dataSource);
    });

    test('should get all questions', () async {
      final result = await repository.getAll();
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (questions) {
          expect(questions.length, 7);
        },
      );
    });

    test('should get question by id', () async {
      final result = await repository.getById('1030');
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (question) {
          expect(question.id, '1030');
          expect(question.type, QuestionType.multipleChoice);
          expect(question.statement, contains('gases nobles'));
        },
      );
    });

    test('should get questions by type', () async {
      final result = await repository.getByType(QuestionType.trueFalse);
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (questions) {
          expect(questions.length, 1);
          expect(questions.first.id, '1032');
        },
      );
    });

    test('should get questions by bank id', () async {
      final result = await repository.getByBankId('B-2045');
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (questions) {
          expect(questions.length, 2);
          expect(questions.any((q) => q.id == '1030'), true);
          expect(questions.any((q) => q.id == '1035'), true);
        },
      );
    });

    test('should search questions', () async {
      final result = await repository.search('mitocondria');
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (questions) {
          expect(questions.length, 1);
          expect(questions.first.id, '1032');
        },
      );
    });
  });

  group('QuestionBank Tests', () {
    late QuestionBankLocalDataSource dataSource;
    late QuestionBankRepository repository;

    setUp(() {
      dataSource = QuestionBankLocalDataSourceImpl();
      repository = QuestionBankRepositoryImpl(localDataSource: dataSource);
    });

    test('should get all question banks', () async {
      final result = await repository.getAll();
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (banks) {
          expect(banks.length, 4);
        },
      );
    });

    test('should get question bank by id', () async {
      final result = await repository.getById('B-2045');
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (bank) {
          expect(bank.id, 'B-2045');
          expect(bank.name, 'Examen Final de Matemáticas 2024');
          expect(bank.questionIds.length, 2);
        },
      );
    });

    test('should search question banks', () async {
      final result = await repository.search('Biología');
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (banks) {
          expect(banks.length, 1);
          expect(banks.first.name, 'Biología Celular - Unidad 1');
        },
      );
    });

    test('should create a new question bank', () async {
      final newBank = QuestionBank(
        id: '',
        name: 'Test Bank',
        description: 'A test bank',
        questionIds: const [],
        createdAt: DateTime(2024, 1, 1),
      );

      final result = await repository.create(newBank);
      
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Expected success but got failure: $failure'),
        (bank) {
          expect(bank.name, 'Test Bank');
          expect(bank.id.isNotEmpty, true);
        },
      );
    });
  });

  group('Adapter Tests', () {
    test('TagAdapter should convert DTO to Entity and back', () {
      const dto = TagDto(
        id: '1',
        name: 'Test Tag',
        color: '#FF0000',
      );

      final entity = TagAdapter.toEntity(dto);
      expect(entity.id, dto.id);
      expect(entity.name, dto.name);
      expect(entity.color, dto.color);

      final dtoAgain = TagAdapter.toDto(entity);
      expect(dtoAgain.id, dto.id);
      expect(dtoAgain.name, dto.name);
      expect(dtoAgain.color, dto.color);
    });

    test('QuestionAdapter should convert DTO to Entity with correct type', () {
      final dto = QuestionDto(
        id: '1',
        statement: 'Test question',
        type: 'single_choice',
        tags: const [],
        options: const [],
        createdAt: DateTime(2024, 1, 1),
      );

      final entity = QuestionAdapter.toEntity(dto);
      expect(entity.type, QuestionType.singleChoice);

      final dtoAgain = QuestionAdapter.toDto(entity);
      expect(dtoAgain.type, 'single_choice');
    });

    test('QuestionTypeExtension should convert string to enum', () {
      expect(QuestionTypeExtension.fromString('multiple_choice'), 
             QuestionType.multipleChoice);
      expect(QuestionTypeExtension.fromString('single_choice'), 
             QuestionType.singleChoice);
      expect(QuestionTypeExtension.fromString('true_false'), 
             QuestionType.trueFalse);
      expect(QuestionTypeExtension.fromString('matching'), 
             QuestionType.matching);
      expect(QuestionTypeExtension.fromString('fill_in_blank'), 
             QuestionType.fillInBlank);
      expect(QuestionTypeExtension.fromString('multimedia'), 
             QuestionType.multimedia);
      expect(QuestionTypeExtension.fromString('image'), 
             QuestionType.image);
    });

    test('QuestionType should convert enum to string', () {
      expect(QuestionType.multipleChoice.toStringValue(), 'multiple_choice');
      expect(QuestionType.singleChoice.toStringValue(), 'single_choice');
      expect(QuestionType.trueFalse.toStringValue(), 'true_false');
      expect(QuestionType.matching.toStringValue(), 'matching');
      expect(QuestionType.fillInBlank.toStringValue(), 'fill_in_blank');
      expect(QuestionType.multimedia.toStringValue(), 'multimedia');
      expect(QuestionType.image.toStringValue(), 'image');
    });
  });

  group('Mock Data Tests', () {
    test('TagMockData should have 8 tags', () {
      expect(TagMockData.items.length, 8);
      expect(TagMockData.items.first.name, 'Química');
      expect(TagMockData.items.last.name, 'Cultura General');
    });

    test('QuestionMockData should have 7 questions of different types', () {
      expect(QuestionMockData.items.length, 7);
      
      final types = QuestionMockData.items.map((q) => q.type).toSet();
      expect(types.contains('multiple_choice'), true);
      expect(types.contains('single_choice'), true);
      expect(types.contains('true_false'), true);
      expect(types.contains('matching'), true);
      expect(types.contains('fill_in_blank'), true);
      expect(types.contains('multimedia'), true);
      expect(types.contains('image'), true);
    });

    test('QuestionBankMockData should have 4 banks', () {
      expect(QuestionBankMockData.items.length, 4);
      expect(QuestionBankMockData.items.first.name, 
             'Examen Final de Matemáticas 2024');
    });
  });
}
