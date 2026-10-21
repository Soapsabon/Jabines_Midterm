/// One selectable answer and the points it is worth.
class AnswerOption {
  const AnswerOption({required this.text, required this.score});

  final String text;
  final int score;
}

/// A single wellness question.
class Question {
  const Question({
    required this.category,
    required this.text,
    required this.options,
  });

  final String category;
  final String text;
  final List<AnswerOption> options;

  /// Highest score a user can earn on this question.
  int get maxScore =>
      options.fold<int>(0, (best, o) => o.score > best ? o.score : best);
}
