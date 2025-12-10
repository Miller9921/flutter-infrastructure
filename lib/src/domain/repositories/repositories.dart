import 'package:dartz/dartz.dart';
import '../entities/entities.dart';
import '../failures/failure.dart';

/// Repository interface for Question operations
abstract class QuestionRepository {
  Future<Either<Failure, List<Question>>> getAll();
  Future<Either<Failure, Question>> getById(String id);
  Future<Either<Failure, List<Question>>> search(String query);
  Future<Either<Failure, List<Question>>> getByType(QuestionType type);
  Future<Either<Failure, List<Question>>> getByBankId(String bankId);
  Future<Either<Failure, Question>> create(Question question);
  Future<Either<Failure, Question>> update(Question question);
  Future<Either<Failure, void>> delete(String id);
  Future<Either<Failure, List<Question>>> bulkImport(List<Question> questions);
}

/// Repository interface for QuestionBank operations
abstract class QuestionBankRepository {
  Future<Either<Failure, List<QuestionBank>>> getAll();
  Future<Either<Failure, QuestionBank>> getById(String id);
  Future<Either<Failure, List<QuestionBank>>> search(String query);
  Future<Either<Failure, QuestionBank>> create(QuestionBank bank);
  Future<Either<Failure, QuestionBank>> update(QuestionBank bank);
  Future<Either<Failure, void>> delete(String id);
}

/// Repository interface for Tag operations
abstract class TagRepository {
  Future<Either<Failure, List<Tag>>> getAll();
  Future<Either<Failure, Tag>> getById(String id);
  Future<Either<Failure, List<Tag>>> search(String query);
  Future<Either<Failure, Tag>> create(Tag tag);
  Future<Either<Failure, Tag>> update(Tag tag);
  Future<Either<Failure, void>> delete(String id);
}
