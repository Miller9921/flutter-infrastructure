import '../dtos/question_dto.dart';
import 'mock/question_mock_data.dart';
import 'data_source_utils.dart';

/// Abstract interface for question local data source
abstract class QuestionLocalDataSource {
  Future<List<QuestionDto>> getAll();
  Future<QuestionDto?> getById(String id);
  Future<List<QuestionDto>> search(String query);
  Future<List<QuestionDto>> getByType(String type);
  Future<List<QuestionDto>> getByBankId(String bankId);
  Future<QuestionDto> create(QuestionDto dto);
  Future<QuestionDto> update(QuestionDto dto);
  Future<void> delete(String id);
  Future<List<QuestionDto>> bulkImport(List<QuestionDto> dtos);
}

/// Implementation of question local data source with mock data
class QuestionLocalDataSourceImpl implements QuestionLocalDataSource {
  List<QuestionDto> _questions = List.from(QuestionMockData.items);

  @override
  Future<List<QuestionDto>> getAll() async {
    await DataSourceUtils.simulateNetworkDelay();
    return List.from(_questions);
  }

  @override
  Future<QuestionDto?> getById(String id) async {
    await DataSourceUtils.simulateNetworkDelay();
    try {
      return _questions.firstWhere((q) => q.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<QuestionDto>> search(String query) async {
    await DataSourceUtils.simulateNetworkDelay();
    final lowerQuery = query.toLowerCase();
    return _questions.where((q) {
      return q.statement.toLowerCase().contains(lowerQuery) ||
          q.tags.any((tag) => tag.name.toLowerCase().contains(lowerQuery)) ||
          q.options.any((opt) => opt.text.toLowerCase().contains(lowerQuery));
    }).toList();
  }

  @override
  Future<List<QuestionDto>> getByType(String type) async {
    await DataSourceUtils.simulateNetworkDelay();
    return _questions.where((q) => q.type == type).toList();
  }

  @override
  Future<List<QuestionDto>> getByBankId(String bankId) async {
    await DataSourceUtils.simulateNetworkDelay();
    return _questions.where((q) => q.bankId == bankId).toList();
  }

  @override
  Future<QuestionDto> create(QuestionDto dto) async {
    await DataSourceUtils.simulateNetworkDelay();
    
    // Generate ID if not provided
    final id = dto.id.isEmpty ? DataSourceUtils.generateId() : dto.id;
    final now = DateTime.now();
    
    final newQuestion = QuestionDto(
      id: id,
      statement: dto.statement,
      type: dto.type,
      tags: dto.tags,
      bankId: dto.bankId,
      options: dto.options,
      hasRandomOrder: dto.hasRandomOrder,
      hasMultipleAnswers: dto.hasMultipleAnswers,
      hasFeedbackEnabled: dto.hasFeedbackEnabled,
      mediaUrl: dto.mediaUrl,
      isEmbedded: dto.isEmbedded,
      createdAt: now,
      updatedAt: null,
    );
    
    _questions.add(newQuestion);
    return newQuestion;
  }

  @override
  Future<QuestionDto> update(QuestionDto dto) async {
    await DataSourceUtils.simulateNetworkDelay();
    
    final index = _questions.indexWhere((q) => q.id == dto.id);
    if (index == -1) {
      throw Exception('Question not found: ${dto.id}');
    }
    
    final updatedQuestion = QuestionDto(
      id: dto.id,
      statement: dto.statement,
      type: dto.type,
      tags: dto.tags,
      bankId: dto.bankId,
      options: dto.options,
      hasRandomOrder: dto.hasRandomOrder,
      hasMultipleAnswers: dto.hasMultipleAnswers,
      hasFeedbackEnabled: dto.hasFeedbackEnabled,
      mediaUrl: dto.mediaUrl,
      isEmbedded: dto.isEmbedded,
      createdAt: _questions[index].createdAt,
      updatedAt: DateTime.now(),
    );
    
    _questions[index] = updatedQuestion;
    return updatedQuestion;
  }

  @override
  Future<void> delete(String id) async {
    await DataSourceUtils.simulateNetworkDelay();
    _questions.removeWhere((q) => q.id == id);
  }

  @override
  Future<List<QuestionDto>> bulkImport(List<QuestionDto> dtos) async {
    await DataSourceUtils.simulateNetworkDelay();
    
    final imported = <QuestionDto>[];
    for (final dto in dtos) {
      final created = await create(dto);
      imported.add(created);
    }
    
    return imported;
  }
}
