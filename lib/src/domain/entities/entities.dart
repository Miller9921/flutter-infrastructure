/// Represents the type of question
enum QuestionType {
  multipleChoice,  // Multiple selection
  singleChoice,    // Single selection
  trueFalse,       // True/False
  matching,        // Matching pairs
  fillInBlank,     // Fill in the blank
  multimedia,      // Multimedia question
  image,           // Image-based question
}

/// Extension to convert string to QuestionType
extension QuestionTypeExtension on QuestionType {
  String toStringValue() {
    switch (this) {
      case QuestionType.multipleChoice:
        return 'multiple_choice';
      case QuestionType.singleChoice:
        return 'single_choice';
      case QuestionType.trueFalse:
        return 'true_false';
      case QuestionType.matching:
        return 'matching';
      case QuestionType.fillInBlank:
        return 'fill_in_blank';
      case QuestionType.multimedia:
        return 'multimedia';
      case QuestionType.image:
        return 'image';
    }
  }

  static QuestionType fromString(String value) {
    switch (value) {
      case 'multiple_choice':
        return QuestionType.multipleChoice;
      case 'single_choice':
        return QuestionType.singleChoice;
      case 'true_false':
        return QuestionType.trueFalse;
      case 'matching':
        return QuestionType.matching;
      case 'fill_in_blank':
        return QuestionType.fillInBlank;
      case 'multimedia':
        return QuestionType.multimedia;
      case 'image':
        return QuestionType.image;
      default:
        throw ArgumentError('Unknown question type: $value');
    }
  }
}

/// Represents a tag for categorizing questions
class Tag {
  final String id;
  final String name;
  final String? color;

  const Tag({
    required this.id,
    required this.name,
    this.color,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tag &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          color == other.color;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;
}

/// Represents an option for a question
class QuestionOption {
  final String id;
  final String text;
  final bool isCorrect;
  final String? feedback;
  final String? imageUrl;
  final String? matchingPair;

  const QuestionOption({
    required this.id,
    required this.text,
    required this.isCorrect,
    this.feedback,
    this.imageUrl,
    this.matchingPair,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionOption &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          isCorrect == other.isCorrect &&
          feedback == other.feedback &&
          imageUrl == other.imageUrl &&
          matchingPair == other.matchingPair;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      isCorrect.hashCode ^
      feedback.hashCode ^
      imageUrl.hashCode ^
      matchingPair.hashCode;
}

/// Represents a question in the LMS
class Question {
  final String id;
  final String statement;
  final QuestionType type;
  final List<Tag> tags;
  final String? bankId;
  final List<QuestionOption> options;
  final bool hasRandomOrder;
  final bool hasMultipleAnswers;
  final bool hasFeedbackEnabled;
  final String? mediaUrl;
  final bool isEmbedded;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Question({
    required this.id,
    required this.statement,
    required this.type,
    required this.tags,
    this.bankId,
    required this.options,
    this.hasRandomOrder = false,
    this.hasMultipleAnswers = false,
    this.hasFeedbackEnabled = false,
    this.mediaUrl,
    this.isEmbedded = false,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/// Represents a question bank
class QuestionBank {
  final String id;
  final String name;
  final String? description;
  final List<String> questionIds;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const QuestionBank({
    required this.id,
    required this.name,
    this.description,
    required this.questionIds,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionBank &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
