import 'package:campus_wellness_tracker/main.dart';
import 'package:campus_wellness_tracker/models/wellness_result.dart';
import 'package:campus_wellness_tracker/state/assessment_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('controller tracks running score and completes', () {
    final c = AssessmentController();
    expect(c.totalScore, 0);

    // Always pick the last option of each question.
    for (var i = 0; i < c.questions.length; i++) {
      c.selectAnswer(c.currentQuestion.options.length - 1);
    }

    expect(c.isComplete, true);
    expect(c.totalScore, greaterThan(0));
    expect(c.totalScore, lessThanOrEqualTo(c.maxScore));

    c.restart();
    expect(c.totalScore, 0);
    expect(c.isComplete, false);
  });

  test('feedback changes with the score range', () {
    expect(
      WellnessResult.fromScore(24, 24).level,
      WellnessLevel.excellent,
    );
    expect(
      WellnessResult.fromScore(15, 24).level,
      WellnessLevel.moderate,
    );
    expect(
      WellnessResult.fromScore(7, 24).level,
      WellnessLevel.needsImprovement,
    );
  });

  testWidgets('home screen opens the first question', (tester) async {
    await tester.pumpWidget(const CampusWellnessApp());

    expect(find.text('Campus Wellness Tracker'), findsOneWidget);
    expect(find.text('Start Assessment'), findsOneWidget);

    await tester.tap(find.text('Start Assessment'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Question 1 of'), findsOneWidget);
  });
}
