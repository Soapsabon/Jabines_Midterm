import 'package:flutter/foundation.dart';

import '../data/questions_data.dart';
import '../models/question.dart';
import '../models/wellness_result.dart';

/// Holds the assessment state: current question, chosen answers and the
/// running score. Widgets listen to it with [ListenableBuilder].
class AssessmentController extends ChangeNotifier {
  AssessmentController({List<Question>? questions})
      : questions = questions ?? kQuestions {
    _selected = List<int?>.filled(this.questions.length, null);
  }

  final List<Question> questions;
  late List<int?> _selected;
  int _current = 0;
  bool _completed = false;

  int get currentIndex => _current;
  Question get currentQuestion => questions[_current];
  bool get isComplete => _completed;

  int get answeredCount => _selected.where((s) => s != null).length;

  /// Running score based on every answer chosen so far.
  int get totalScore {
    var total = 0;
    for (var i = 0; i < questions.length; i++) {
      final choice = _selected[i];
      if (choice != null) total += questions[i].options[choice].score;
    }
    return total;
  }

  int get maxScore => questions.fold<int>(0, (sum, q) => sum + q.maxScore);

  List<CategoryScore> get breakdown => [
        for (var i = 0; i < questions.length; i++)
          CategoryScore(
            category: questions[i].category,
            score: _selected[i] == null
                ? 0
                : questions[i].options[_selected[i]!].score,
            max: questions[i].maxScore,
          ),
      ];

  /// Records the chosen option and moves to the next question.
  void selectAnswer(int optionIndex) {
    if (_completed) return;
    _selected[_current] = optionIndex;
    if (_current < questions.length - 1) {
      _current++;
    } else {
      _completed = true;
    }
    notifyListeners();
  }

  void restart() {
    _selected = List<int?>.filled(questions.length, null);
    _current = 0;
    _completed = false;
    notifyListeners();
  }
}
