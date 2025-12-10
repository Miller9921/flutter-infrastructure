import '../domain/entities/entities.dart';
import '../dtos/tag_dto.dart';

/// Adapter to convert between Tag entity and TagDto
abstract class TagAdapter {
  /// Converts a TagDto to a Tag entity
  static Tag toEntity(TagDto dto) {
    return Tag(
      id: dto.id,
      name: dto.name,
      color: dto.color,
    );
  }

  /// Converts a Tag entity to a TagDto
  static TagDto toDto(Tag entity) {
    return TagDto(
      id: entity.id,
      name: entity.name,
      color: entity.color,
    );
  }

  /// Converts a list of TagDto to a list of Tag entities
  static List<Tag> toEntityList(List<TagDto> dtos) {
    return dtos.map((dto) => toEntity(dto)).toList();
  }

  /// Converts a list of Tag entities to a list of TagDto
  static List<TagDto> toDtoList(List<Tag> entities) {
    return entities.map((entity) => toDto(entity)).toList();
  }
}
