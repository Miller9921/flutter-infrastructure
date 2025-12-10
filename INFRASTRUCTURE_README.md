# Infrastructure - LMS Question Management

Capa de infraestructura para el módulo LMS de Gestión de Preguntas.

## Descripción

Este paquete implementa la capa de infraestructura con:
- **DTOs** (Data Transfer Objects) con serialización JSON
- **Adapters** para conversión entre DTOs y Entidades
- **Data Sources** locales con datos mock y simulación de latencia
- **Repository Implementations** que implementan los contratos del dominio

## Estructura del Proyecto

```
lib/
├── src/
│   ├── domain/              # Entidades y contratos del dominio
│   │   ├── entities/        # Tag, Question, QuestionBank, QuestionOption
│   │   ├── repositories/    # Interfaces de repositorios
│   │   └── failures/        # Tipos de errores
│   ├── dtos/                # Data Transfer Objects
│   │   ├── tag_dto.dart
│   │   ├── question_option_dto.dart
│   │   ├── question_dto.dart
│   │   └── question_bank_dto.dart
│   ├── adapters/            # Conversores DTO ↔ Entity
│   │   ├── tag_adapter.dart
│   │   ├── question_option_adapter.dart
│   │   ├── question_adapter.dart
│   │   └── question_bank_adapter.dart
│   ├── data_sources/        # Fuentes de datos
│   │   ├── mock/            # Datos de prueba
│   │   ├── question_local_data_source.dart
│   │   ├── question_bank_local_data_source.dart
│   │   └── tag_local_data_source.dart
│   └── repositories/        # Implementaciones de repositorios
│       ├── question_repository_impl.dart
│       ├── question_bank_repository_impl.dart
│       └── tag_repository_impl.dart
└── infrastructure.dart      # Export principal
```

## Características

### DTOs con JSON Serialization

Todos los DTOs usan `@JsonSerializable` para convertir entre objetos Dart y JSON:

```dart
@JsonSerializable()
class TagDto {
  final String id;
  final String name;
  @JsonKey(name: 'color')
  final String? color;
  
  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TagDtoToJson(this);
}
```

### Adapters para Conversión

Los adapters convierten entre DTOs (capa de infraestructura) y Entities (capa de dominio):

```dart
abstract class TagAdapter {
  static Tag toEntity(TagDto dto) { ... }
  static TagDto toDto(Tag entity) { ... }
  static List<Tag> toEntityList(List<TagDto> dtos) { ... }
  static List<TagDto> toDtoList(List<Tag> entities) { ... }
}
```

### Datos Mock con Latencia Simulada

Los data sources incluyen:
- **8 tags** predefinidos (Química, Geografía, Biología, etc.)
- **7 preguntas** de diferentes tipos:
  1. Selección Múltiple (gases nobles)
  2. Selección Única (río más largo)
  3. Verdadero/Falso (mitocondria)
  4. Emparejamiento (países-capitales)
  5. Completado (Clap)
  6. Multimedia (ética empresarial)
  7. Imagen (sistema digestivo)
- **4 bancos de preguntas**
- **Delays de 300-500ms** para simular latencia de red

### Repository Pattern con Either

Los repositorios retornan `Either<Failure, T>` para manejo de errores:

```dart
Future<Either<Failure, List<Question>>> getAll();
Future<Either<Failure, Question>> getById(String id);
Future<Either<Failure, List<Question>>> search(String query);
```

## Uso

### Instalación

Agrega la dependencia en tu `pubspec.yaml`:

```yaml
dependencies:
  infrastructure:
    path: ../infrastructure
```

### Ejemplo de Uso

```dart
import 'package:infrastructure/infrastructure.dart';

void main() async {
  // Crear instancias de data sources
  final questionDataSource = QuestionLocalDataSourceImpl();
  final tagDataSource = TagLocalDataSourceImpl();
  final bankDataSource = QuestionBankLocalDataSourceImpl();
  
  // Crear repositorios
  final questionRepo = QuestionRepositoryImpl(localDataSource: questionDataSource);
  final tagRepo = TagRepositoryImpl(localDataSource: tagDataSource);
  final bankRepo = QuestionBankRepositoryImpl(localDataSource: bankDataSource);
  
  // Obtener todas las preguntas
  final result = await questionRepo.getAll();
  result.fold(
    (failure) => print('Error: $failure'),
    (questions) => print('Encontradas ${questions.length} preguntas'),
  );
  
  // Buscar preguntas
  final searchResult = await questionRepo.search('química');
  searchResult.fold(
    (failure) => print('Error: $failure'),
    (questions) => print('Encontradas ${questions.length} preguntas de química'),
  );
  
  // Obtener pregunta por ID
  final questionResult = await questionRepo.getById('1030');
  questionResult.fold(
    (failure) => print('Error: $failure'),
    (question) => print('Pregunta: ${question.statement}'),
  );
  
  // Crear nueva pregunta
  final newQuestion = Question(
    id: '',
    statement: '¿Cuál es la capital de Francia?',
    type: QuestionType.singleChoice,
    tags: [],
    options: [
      QuestionOption(id: '1', text: 'París', isCorrect: true),
      QuestionOption(id: '2', text: 'Londres', isCorrect: false),
    ],
    createdAt: DateTime.now(),
  );
  
  final createResult = await questionRepo.create(newQuestion);
  createResult.fold(
    (failure) => print('Error: $failure'),
    (question) => print('Pregunta creada con ID: ${question.id}'),
  );
}
```

## Tipos de Preguntas

El sistema soporta 7 tipos de preguntas:

1. **multipleChoice** - Selección múltiple (varias respuestas correctas)
2. **singleChoice** - Selección única (una respuesta correcta)
3. **trueFalse** - Verdadero o Falso
4. **matching** - Emparejamiento (relacionar pares)
5. **fillInBlank** - Completar espacios en blanco
6. **multimedia** - Pregunta con contenido multimedia (video/audio)
7. **image** - Pregunta basada en imagen

## Manejo de Errores

El sistema define los siguientes tipos de errores:

- **NotFoundFailure** - Recurso no encontrado
- **ServerFailure** - Error del servidor
- **CacheFailure** - Error de caché/persistencia local
- **ValidationFailure** - Error de validación

## Pruebas

Ejecuta las pruebas con:

```bash
dart test
```

Las pruebas incluyen:
- Tests unitarios de repositorios
- Tests de conversión de adapters
- Tests de data sources
- Tests de datos mock

## Reglas de Arquitectura

✅ **SI PERMITIDO:**
- Importar domain para implementar interfaces
- Usar json_serializable para DTOs
- Usar adapters para conversión DTO ↔ Entity
- Simular latencia de red con delays

❌ **NO PERMITIDO:**
- Importar Flutter UI (este es un paquete puro de Dart)
- Mezclar lógica de negocio en la infraestructura
- Exponer DTOs fuera de la capa de infraestructura

## Dependencias

- `json_annotation`: Anotaciones para serialización JSON
- `dartz`: Programación funcional (Either, Option, etc.)
- `json_serializable`: Generación de código para serialización
- `build_runner`: Herramienta para generar código

## Notas de Implementación

- Los IDs se generan automáticamente si no se proveen al crear
- Los timestamps se agregan automáticamente (createdAt, updatedAt)
- Las búsquedas son case-insensitive
- Los datos se mantienen en memoria (no persisten entre sesiones)
- Los delays simulan latencia de red realista (300-500ms)
