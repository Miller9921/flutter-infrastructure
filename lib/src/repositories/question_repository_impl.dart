import 'package:dartz/dartz.dart';
import '../domain/entities/entities.dart';
import '../domain/repositories/repositories.dart';
import '../domain/failures/failure.dart';
import '../data_sources/question_local_data_source.dart';
import '../adapters/question_adapter.dart';

/// Implementation of QuestionRepository using local data source
class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionLocalDataSource _localDataSource;

  QuestionRepositoryImpl({required QuestionLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, List<Question>>> getAll() async {
    try {
      final dtos = await _localDataSource.getAll();
      final entities = QuestionAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to get all questions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Question>> getById(String id) async {
    try {
      final dto = await _localDataSource.getById(id);
      if (dto == null) {
        return Left(NotFoundFailure('Question not found: $id'));
      }
      final entity = QuestionAdapter.toEntity(dto);
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure('Failed to get question: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Question>>> search(String query) async {
    try {
      final dtos = await _localDataSource.search(query);
      final entities = QuestionAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to search questions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getByType(QuestionType type) async {
    try {
      final dtos = await _localDataSource.getByType(type.toStringValue());
      final entities = QuestionAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to get questions by type: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getByBankId(String bankId) async {
    try {
      final dtos = await _localDataSource.getByBankId(bankId);
      final entities = QuestionAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to get questions by bank: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Question>> create(Question question) async {
    try {
      final dto = QuestionAdapter.toDto(question);
      final createdDto = await _localDataSource.create(dto);
      final entity = QuestionAdapter.toEntity(createdDto);
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure('Failed to create question: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Question>> update(Question question) async {
    try {
      final dto = QuestionAdapter.toDto(question);
      final updatedDto = await _localDataSource.update(dto);
      final entity = QuestionAdapter.toEntity(updatedDto);
      return Right(entity);
    } catch (e) {
      if (e.toString().contains('not found')) {
        return Left(NotFoundFailure('Question not found: ${question.id}'));
      }
      return Left(CacheFailure('Failed to update question: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await _localDataSource.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to delete question: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Question>>> bulkImport(List<Question> questions) async {
    try {
      final dtos = QuestionAdapter.toDtoList(questions);
      final importedDtos = await _localDataSource.bulkImport(dtos);
      final entities = QuestionAdapter.toEntityList(importedDtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to bulk import questions: ${e.toString()}'));
    }
  }
}
