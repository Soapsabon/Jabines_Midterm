enum WellnessLevel { excellent, moderate, needsImprovement }

/// Score earned in one category.
class CategoryScore {
  const CategoryScore({
    required this.category,
    required this.score,
    required this.max,
  });

  final String category;
  final int score;
  final int max;
}

/// Turns a raw score into a level and feedback message.
class WellnessResult {
  const WellnessResult({
    required this.score,
    required this.maxScore,
    required this.level,
    required this.title,
    required this.recommendation,
  });

  final int score;
  final int maxScore;
  final WellnessLevel level;
  final String title;
  final String recommendation;

  factory WellnessResult.fromScore(int score, int maxScore) {
    final ratio = maxScore == 0 ? 0.0 : score / maxScore;

    if (ratio >= 0.75) {
      return WellnessResult(
        score: score,
        maxScore: maxScore,
        level: WellnessLevel.excellent,
        title: 'Excellent Wellness Habits',
        recommendation: 'Keep maintaining your current habits.',
      );
    }
    if (ratio >= 0.5) {
      return WellnessResult(
        score: score,
        maxScore: maxScore,
        level: WellnessLevel.moderate,
        title: 'Moderate Wellness Habits',
        recommendation:
            'You are doing okay. Try improving your weakest area one small step at a time.',
      );
    }
    return WellnessResult(
      score: score,
      maxScore: maxScore,
      level: WellnessLevel.needsImprovement,
      title: 'Needs Improvement',
      recommendation:
          'Prioritize sleep, water and regular breaks, and talk to someone if you feel overwhelmed.',
    );
  }
}
