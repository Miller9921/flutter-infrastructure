import '../dtos/tag_dto.dart';
import 'mock/tag_mock_data.dart';
import 'data_source_utils.dart';

/// Abstract interface for tag local data source
abstract class TagLocalDataSource {
  Future<List<TagDto>> getAll();
  Future<TagDto?> getById(String id);
  Future<List<TagDto>> search(String query);
  Future<TagDto> create(TagDto dto);
  Future<TagDto> update(TagDto dto);
  Future<void> delete(String id);
}

/// Implementation of tag local data source with mock data
class TagLocalDataSourceImpl implements TagLocalDataSource {
  List<TagDto> _tags = List.from(TagMockData.items);

  @override
  Future<List<TagDto>> getAll() async {
    await DataSourceUtils.simulateNetworkDelay();
    return List.from(_tags);
  }

  @override
  Future<TagDto?> getById(String id) async {
    await DataSourceUtils.simulateNetworkDelay();
    try {
      return _tags.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TagDto>> search(String query) async {
    await DataSourceUtils.simulateNetworkDelay();
    final lowerQuery = query.toLowerCase();
    return _tags.where((t) {
      return t.name.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  @override
  Future<TagDto> create(TagDto dto) async {
    await DataSourceUtils.simulateNetworkDelay();
    
    // Generate ID if not provided
    final id = dto.id.isEmpty ? DataSourceUtils.generateId() : dto.id;
    
    final newTag = TagDto(
      id: id,
      name: dto.name,
      color: dto.color,
    );
    
    _tags.add(newTag);
    return newTag;
  }

  @override
  Future<TagDto> update(TagDto dto) async {
    await DataSourceUtils.simulateNetworkDelay();
    
    final index = _tags.indexWhere((t) => t.id == dto.id);
    if (index == -1) {
      throw Exception('Tag not found: ${dto.id}');
    }
    
    final updatedTag = TagDto(
      id: dto.id,
      name: dto.name,
      color: dto.color,
    );
    
    _tags[index] = updatedTag;
    return updatedTag;
  }

  @override
  Future<void> delete(String id) async {
    await DataSourceUtils.simulateNetworkDelay();
    _tags.removeWhere((t) => t.id == id);
  }
}
