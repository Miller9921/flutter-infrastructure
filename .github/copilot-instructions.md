# Infrastructure Layer - Copilot Instructions

## Architecture Rules

### Dependencies
- **ALWAYS** import `domain` package to implement repository interfaces
- **NEVER** import Flutter UI packages (e.g., `flutter/material.dart`, `flutter/widgets.dart`)
- **NEVER** import `ui_components` or any presentation layer packages

### Data Models
- **ALWAYS** use `json_serializable` for JSON serialization/deserialization
- All models must have:
  - `@JsonSerializable()` annotation
  - `factory Model.fromJson(Map<String, dynamic> json)` method
  - `Map<String, dynamic> toJson()` method
  - `Entity toEntity()` method to convert model to domain entity
  - `factory Model.fromEntity(Entity entity)` method to convert domain entity to model
- Use `@JsonKey(name: 'field_name')` for API fields that use snake_case

### Data Sources
- Remote data sources handle API communication
- Local data sources handle caching and persistence
- Mock data sources provide test data

### Repositories
- Implement repository interfaces from `domain` layer
- Use dependency injection for data sources
- Handle errors and network failures gracefully
- Implement cache fallback strategies

### Code Quality
- Follow Dart best practices
- Use meaningful variable and method names
- Add documentation comments for public APIs
- Keep methods focused and single-purpose
