import '../dtos/question_bank_dto.dart';
import 'mock/question_bank_mock_data.dart';

/// Abstract interface for question bank local data source
abstract class QuestionBankLocalDataSource {
  Future<List<QuestionBankDto>> getAll();
  Future<QuestionBankDto?> getById(String id);
  Future<List<QuestionBankDto>> search(String query);
  Future<QuestionBankDto> create(QuestionBankDto dto);
  Future<QuestionBankDto> update(QuestionBankDto dto);
  Future<void> delete(String id);
}

/// Implementation of question bank local data source with mock data
class QuestionBankLocalDataSourceImpl implements QuestionBankLocalDataSource {
  List<QuestionBankDto> _banks = List.from(QuestionBankMockData.items);

  /// Simulates network latency
  Future<void> _simulateDelay() async {
    await Future.delayed(
      Duration(milliseconds: 300 + (100 * (0.5 - (DateTime.now().millisecond % 1000) / 1000)).round()),
    );
  }

  @override
  Future<List<QuestionBankDto>> getAll() async {
    await _simulateDelay();
    return List.from(_banks);
  }

  @override
  Future<QuestionBankDto?> getById(String id) async {
    await _simulateDelay();
    try {
      return _banks.firstWhere((b) => b.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<QuestionBankDto>> search(String query) async {
    await _simulateDelay();
    final lowerQuery = query.toLowerCase();
    return _banks.where((b) {
      return b.name.toLowerCase().contains(lowerQuery) ||
          (b.description?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  @override
  Future<QuestionBankDto> create(QuestionBankDto dto) async {
    await _simulateDelay();
    
    // Generate ID if not provided
    final id = dto.id.isEmpty ? _generateId() : dto.id;
    final now = DateTime.now();
    
    final newBank = QuestionBankDto(
      id: id,
      name: dto.name,
      description: dto.description,
      questionIds: List<String>.from(dto.questionIds),
      createdAt: now,
      updatedAt: null,
    );
    
    _banks.add(newBank);
    return newBank;
  }

  @override
  Future<QuestionBankDto> update(QuestionBankDto dto) async {
    await _simulateDelay();
    
    final index = _banks.indexWhere((b) => b.id == dto.id);
    if (index == -1) {
      throw Exception('Question bank not found: ${dto.id}');
    }
    
    final updatedBank = QuestionBankDto(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      questionIds: List<String>.from(dto.questionIds),
      createdAt: _banks[index].createdAt,
      updatedAt: DateTime.now(),
    );
    
    _banks[index] = updatedBank;
    return updatedBank;
  }

  @override
  Future<void> delete(String id) async {
    await _simulateDelay();
    _banks.removeWhere((b) => b.id == id);
  }

  /// Generates a unique ID for a question bank
  String _generateId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = timestamp % 10000;
    return 'B-$random';
  }
}
