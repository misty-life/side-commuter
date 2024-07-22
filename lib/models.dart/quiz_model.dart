class Quiz {
  final int id;
  final String question;
  final String? description;
  final List<dynamic> answers;
  final String multipleCorrectAnswers;
  final List<dynamic> correctAnswers;
  final String? correctAnswer;
  final String? explanation;
  final String? tip;
  final String category;
  final String difficulty;


  Quiz({
    required this.id,
    required this.question,
    this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    this.correctAnswer,
    required this.explanation,
    required this.tip,
    required this.category,
    required this.difficulty,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    id: json["id"],
    question: json["question"],
    description: json["description"],
    answers: (json["answers"] as Map<String, dynamic>).values.toList(),
    multipleCorrectAnswers: json["multiple_correct_answers"],
    correctAnswers: (json["correct_answers"] as Map<String, dynamic>).values.toList(),
    correctAnswer: json["correct_answer"],
    explanation: json["explanation"],
    tip: json["tip"],
    category: json["category"],
    difficulty: json["difficulty"],
  );
}