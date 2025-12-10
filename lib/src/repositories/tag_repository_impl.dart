import 'package:dartz/dartz.dart';
import '../domain/entities/entities.dart';
import '../domain/repositories/repositories.dart';
import '../domain/failures/failure.dart';
import '../data_sources/tag_local_data_source.dart';
import '../adapters/tag_adapter.dart';

/// Implementation of TagRepository using local data source
class TagRepositoryImpl implements TagRepository {
  final TagLocalDataSource _localDataSource;

  TagRepositoryImpl({required TagLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, List<Tag>>> getAll() async {
    try {
      final dtos = await _localDataSource.getAll();
      final entities = TagAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to get all tags: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Tag>> getById(String id) async {
    try {
      final dto = await _localDataSource.getById(id);
      if (dto == null) {
        return Left(NotFoundFailure('Tag not found: $id'));
      }
      final entity = TagAdapter.toEntity(dto);
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure('Failed to get tag: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Tag>>> search(String query) async {
    try {
      final dtos = await _localDataSource.search(query);
      final entities = TagAdapter.toEntityList(dtos);
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure('Failed to search tags: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Tag>> create(Tag tag) async {
    try {
      final dto = TagAdapter.toDto(tag);
      final createdDto = await _localDataSource.create(dto);
      final entity = TagAdapter.toEntity(createdDto);
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure('Failed to create tag: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Tag>> update(Tag tag) async {
    try {
      final dto = TagAdapter.toDto(tag);
      final updatedDto = await _localDataSource.update(dto);
      final entity = TagAdapter.toEntity(updatedDto);
      return Right(entity);
    } catch (e) {
      if (e.toString().contains('not found')) {
        return Left(NotFoundFailure('Tag not found: ${tag.id}'));
      }
      return Left(CacheFailure('Failed to update tag: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await _localDataSource.delete(id);
      return const Right(());
    } catch (e) {
      return Left(CacheFailure('Failed to delete tag: ${e.toString()}'));
    }
  }
}
