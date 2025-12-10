import '../../dtos/question_dto.dart';
import '../../dtos/question_option_dto.dart';
import '../../dtos/tag_dto.dart';

/// Mock data for questions
class QuestionMockData {
  static final List<QuestionDto> items = [
    // 1. Multiple Choice - Química
    QuestionDto(
      id: '1030',
      statement: 'Seleccione los elementos de la tabla periódica que son gases nobles.',
      type: 'multiple_choice',
      tags: const [
        TagDto(id: '1', name: 'Química', color: '#10B981'),
      ],
      bankId: 'B-2045',
      options: const [
        QuestionOptionDto(
          id: '1030-1',
          text: 'Helio (He)',
          isCorrect: true,
          feedback: 'Correcto, el helio es un gas noble.',
        ),
        QuestionOptionDto(
          id: '1030-2',
          text: 'Oxígeno (O)',
          isCorrect: false,
          feedback: 'Incorrecto, el oxígeno no es un gas noble.',
        ),
        QuestionOptionDto(
          id: '1030-3',
          text: 'Neón (Ne)',
          isCorrect: true,
          feedback: 'Correcto, el neón es un gas noble.',
        ),
        QuestionOptionDto(
          id: '1030-4',
          text: 'Argón (Ar)',
          isCorrect: true,
          feedback: 'Correcto, el argón es un gas noble.',
        ),
        QuestionOptionDto(
          id: '1030-5',
          text: 'Nitrógeno (N)',
          isCorrect: false,
          feedback: 'Incorrecto, el nitrógeno no es un gas noble.',
        ),
      ],
      hasRandomOrder: true,
      hasMultipleAnswers: true,
      hasFeedbackEnabled: true,
      isEmbedded: false,
      createdAt: DateTime(2023, 9, 15, 10, 30),
      updatedAt: DateTime(2023, 10, 20, 14, 15),
    ),

    // 2. Single Choice - Geografía
    QuestionDto(
      id: '1031',
      statement: '¿Cuál es el río más largo del mundo?',
      type: 'single_choice',
      tags: const [
        TagDto(id: '2', name: 'Geografía', color: '#3B82F6'),
      ],
      bankId: null,
      options: const [
        QuestionOptionDto(
          id: '1031-1',
          text: 'Río Nilo',
          isCorrect: true,
          feedback: 'Correcto, el Nilo es el río más largo con aproximadamente 6,650 km.',
        ),
        QuestionOptionDto(
          id: '1031-2',
          text: 'Río Amazonas',
          isCorrect: false,
          feedback: 'Aunque es el más caudaloso, no es el más largo.',
        ),
        QuestionOptionDto(
          id: '1031-3',
          text: 'Río Yangtsé',
          isCorrect: false,
          feedback: 'Es el río más largo de Asia, pero no del mundo.',
        ),
        QuestionOptionDto(
          id: '1031-4',
          text: 'Río Misisipi',
          isCorrect: false,
          feedback: 'Es uno de los ríos más importantes de América del Norte, pero no el más largo del mundo.',
        ),
      ],
      hasRandomOrder: true,
      hasMultipleAnswers: false,
      hasFeedbackEnabled: true,
      isEmbedded: false,
      createdAt: DateTime(2023, 9, 20, 11, 0),
    ),

    // 3. True/False - Biología
    QuestionDto(
      id: '1032',
      statement: 'La mitocondria es conocida como la central energética de la célula.',
      type: 'true_false',
      tags: const [
        TagDto(id: '3', name: 'Biología', color: '#8B5CF6'),
      ],
      bankId: 'B-2046',
      options: const [
        QuestionOptionDto(
          id: '1032-1',
          text: 'Verdadero',
          isCorrect: true,
          feedback: 'Correcto, las mitocondrias generan ATP, la principal fuente de energía celular.',
        ),
        QuestionOptionDto(
          id: '1032-2',
          text: 'Falso',
          isCorrect: false,
          feedback: 'Incorrecto, las mitocondrias sí son las centrales energéticas de la célula.',
        ),
      ],
      hasRandomOrder: false,
      hasMultipleAnswers: false,
      hasFeedbackEnabled: true,
      isEmbedded: false,
      createdAt: DateTime(2023, 10, 1, 9, 45),
      updatedAt: DateTime(2023, 10, 15, 16, 30),
    ),

    // 4. Matching - Cultura General
    QuestionDto(
      id: '1033',
      statement: 'Relacione cada país con su capital correspondiente.',
      type: 'matching',
      tags: const [
        TagDto(id: '8', name: 'Cultura General', color: '#6366F1'),
      ],
      bankId: null,
      options: const [
        QuestionOptionDto(
          id: '1033-1',
          text: 'Francia',
          isCorrect: true,
          matchingPair: 'París',
        ),
        QuestionOptionDto(
          id: '1033-2',
          text: 'Japón',
          isCorrect: true,
          matchingPair: 'Tokio',
        ),
        QuestionOptionDto(
          id: '1033-3',
          text: 'Brasil',
          isCorrect: true,
          matchingPair: 'Brasilia',
        ),
        QuestionOptionDto(
          id: '1033-4',
          text: 'Australia',
          isCorrect: true,
          matchingPair: 'Canberra',
        ),
        QuestionOptionDto(
          id: '1033-5',
          text: 'Egipto',
          isCorrect: true,
          matchingPair: 'El Cairo',
        ),
      ],
      hasRandomOrder: true,
      hasMultipleAnswers: false,
      hasFeedbackEnabled: false,
      isEmbedded: false,
      createdAt: DateTime(2023, 10, 5, 13, 20),
    ),

    // 5. Fill in the Blank
    QuestionDto(
      id: '1034',
      statement: '@@Clap@@ diseña, despliega y @@gestiona@@ procesos de @@formación@@.',
      type: 'fill_in_blank',
      tags: const [
        TagDto(id: '8', name: 'Cultura General', color: '#6366F1'),
      ],
      bankId: null,
      options: const [
        QuestionOptionDto(
          id: '1034-1',
          text: 'Clap',
          isCorrect: true,
          feedback: 'Primera palabra correcta',
        ),
        QuestionOptionDto(
          id: '1034-2',
          text: 'gestiona',
          isCorrect: true,
          feedback: 'Segunda palabra correcta',
        ),
        QuestionOptionDto(
          id: '1034-3',
          text: 'formación',
          isCorrect: true,
          feedback: 'Tercera palabra correcta',
        ),
      ],
      hasRandomOrder: false,
      hasMultipleAnswers: false,
      hasFeedbackEnabled: true,
      isEmbedded: false,
      createdAt: DateTime(2023, 10, 10, 10, 0),
    ),

    // 6. Multimedia - Ética
    QuestionDto(
      id: '1035',
      statement: 'Analice el caso presentado en el video sobre ética empresarial.',
      type: 'multimedia',
      tags: const [
        TagDto(id: '6', name: 'Ética', color: '#EC4899'),
      ],
      bankId: 'B-2045',
      options: const [
        QuestionOptionDto(
          id: '1035-1',
          text: 'La empresa actuó de manera ética',
          isCorrect: true,
          feedback: 'Correcto, la empresa siguió los principios éticos establecidos.',
        ),
        QuestionOptionDto(
          id: '1035-2',
          text: 'La empresa violó principios éticos',
          isCorrect: false,
          feedback: 'Incorrecto, la empresa siguió los protocolos éticos adecuados.',
        ),
        QuestionOptionDto(
          id: '1035-3',
          text: 'El caso no tiene implicaciones éticas',
          isCorrect: false,
          feedback: 'Incorrecto, todo caso empresarial tiene implicaciones éticas.',
        ),
      ],
      hasRandomOrder: false,
      hasMultipleAnswers: false,
      hasFeedbackEnabled: true,
      mediaUrl: 'https://example.com/videos/etica-empresarial-caso1.mp4',
      isEmbedded: true,
      createdAt: DateTime(2023, 10, 12, 15, 30),
      updatedAt: DateTime(2023, 11, 1, 9, 0),
    ),

    // 7. Image - Anatomía
    QuestionDto(
      id: '1036',
      statement: 'Señale en la imagen las partes del sistema digestivo.',
      type: 'image',
      tags: const [
        TagDto(id: '7', name: 'Anatomía', color: '#14B8A6'),
      ],
      bankId: null,
      options: const [
        QuestionOptionDto(
          id: '1036-1',
          text: 'Esófago',
          isCorrect: true,
          feedback: 'Correcto, el esófago conecta la boca con el estómago.',
        ),
        QuestionOptionDto(
          id: '1036-2',
          text: 'Estómago',
          isCorrect: true,
          feedback: 'Correcto, el estómago es donde se inicia la digestión.',
        ),
        QuestionOptionDto(
          id: '1036-3',
          text: 'Intestino delgado',
          isCorrect: true,
          feedback: 'Correcto, el intestino delgado absorbe los nutrientes.',
        ),
        QuestionOptionDto(
          id: '1036-4',
          text: 'Intestino grueso',
          isCorrect: true,
          feedback: 'Correcto, el intestino grueso absorbe agua y forma las heces.',
        ),
        QuestionOptionDto(
          id: '1036-5',
          text: 'Hígado',
          isCorrect: true,
          feedback: 'Correcto, el hígado produce bilis para la digestión de grasas.',
        ),
      ],
      hasRandomOrder: false,
      hasMultipleAnswers: true,
      hasFeedbackEnabled: true,
      mediaUrl: 'https://example.com/images/sistema-digestivo.jpg',
      isEmbedded: false,
      createdAt: DateTime(2023, 10, 18, 11, 45),
    ),
  ];
}
