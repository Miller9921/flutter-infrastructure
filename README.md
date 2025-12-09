# Flutter Infrastructure

Capa de infraestructura - Implementaciones de repositorios y data sources.

## Descripción

Este paquete implementa los contratos definidos en el dominio. Maneja la persistencia, APIs y transformación de datos.

## Reglas de Arquitectura

- Importar domain para implementar interfaces
- Usar json_serializable para modelos
- NUNCA importar Flutter UI
- Los modelos tienen métodos toEntity() y fromEntity()

## Estructura

```
lib/
├── src/
│   ├── models/
│   ├── repositories/
│   ├── data_sources/
│   │   ├── remote/
│   │   └── local/
│   └── mappers/
└── infrastructure.dart
```

## Uso

```dart
import 'package:infrastructure/infrastructure.dart';

final repository = ProductRepositoryImpl(
  remoteDataSource: ProductRemoteDataSourceImpl(),
  localDataSource: ProductLocalDataSourceImpl(),
);
```
