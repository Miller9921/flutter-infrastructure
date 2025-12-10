import '../../dtos/tag_dto.dart';

/// Mock data for tags
class TagMockData {
  static final List<TagDto> items = [
    const TagDto(
      id: '1',
      name: 'Química',
      color: '#10B981',
    ),
    const TagDto(
      id: '2',
      name: 'Geografía',
      color: '#3B82F6',
    ),
    const TagDto(
      id: '3',
      name: 'Biología',
      color: '#8B5CF6',
    ),
    const TagDto(
      id: '4',
      name: 'Matemáticas',
      color: '#F59E0B',
    ),
    const TagDto(
      id: '5',
      name: 'Historia',
      color: '#EF4444',
    ),
    const TagDto(
      id: '6',
      name: 'Ética',
      color: '#EC4899',
    ),
    const TagDto(
      id: '7',
      name: 'Anatomía',
      color: '#14B8A6',
    ),
    const TagDto(
      id: '8',
      name: 'Cultura General',
      color: '#6366F1',
    ),
  ];
}
