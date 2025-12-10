/// Infrastructure layer for the LMS Question Management module
/// 
/// This library provides DTOs, Adapters, Data Sources, and Repository
/// implementations for managing questions, question banks, and tags.
library infrastructure;

// Domain exports (entities, repositories interfaces, failures)
export 'src/domain/entities/entities.dart';
export 'src/domain/repositories/repositories.dart';
export 'src/domain/failures/failure.dart';

// DTOs
export 'src/dtos/dtos.dart';

// Adapters
export 'src/adapters/adapters.dart';

// Data Sources
export 'src/data_sources/data_sources.dart';

// Repository Implementations
export 'src/repositories/repositories.dart';
