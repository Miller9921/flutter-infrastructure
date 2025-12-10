import 'package:dartz/dartz.dart';
import '../domain/entities/entities.dart';
import '../domain/repositories/repositories.dart';
import '../domain/failures/failure.dart';
import '../data_sources/question_bank_local_data_source.dart';
import '../adapters/question_bank_adapter.dart';

/// Implementation of QuestionBankRepository using local data source
class QuestionBankRepositoryImpl implements QuestionBankRepository {
  final QuestionBankLocalDataSource _localDataSource;

  QuestionBankRepositoryImpl({required QuestionBankLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, List<QuestionBank>>> getAll() async {
    try {
      final dtos = await _localDataSource.getAll();
      final entities = QuestionBankAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to get all question banks: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, QuestionBank>> getById(String id) async {
    try {
      final dto = await _localDataSource.getById(id);
      if (dto == null) {
        return Left(NotFoundFailure('Question bank not found: $id'));
      }
      final entity = QuestionBankAdapter.toEntity(dto);
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure('Failed to get question bank: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<QuestionBank>>> search(String query) async {
    try {
      final dtos = await _localDataSource.search(query);
      final entities = QuestionBankAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to search question banks: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, QuestionBank>> create(QuestionBank bank) async {
    try {
      final dto = QuestionBankAdapter.toDto(bank);
      final createdDto = await _localDataSource.create(dto);
      final entity = QuestionBankAdapter.toEntity(createdDto);
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure('Failed to create question bank: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, QuestionBank>> update(QuestionBank bank) async {
    try {
      final dto = QuestionBankAdapter.toDto(bank);
      final updatedDto = await _localDataSource.update(dto);
      final entity = QuestionBankAdapter.toEntity(updatedDto);
      return Right(entity);
    } catch (e) {
      if (e.toString().contains('not found')) {
        return Left(NotFoundFailure('Question bank not found: ${bank.id}'));
      }
      return Left(CacheFailure('Failed to update question bank: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await _localDataSource.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to delete question bank: ${e.toString()}'));
    }
  }
}
