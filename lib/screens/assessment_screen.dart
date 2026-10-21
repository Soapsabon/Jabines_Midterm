import 'package:flutter/material.dart';

import '../state/assessment_controller.dart';
import 'results_screen.dart';

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key, required this.assessment});

  final AssessmentController assessment;

  void _select(BuildContext context, int optionIndex) {
    assessment.selectAnswer(optionIndex);
    if (assessment.isComplete) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultsScreen(assessment: assessment),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Check-in')),
      body: ListenableBuilder(
        listenable: assessment,
        builder: (context, _) {
          final number = assessment.currentIndex + 1;
          final total = assessment.questions.length;
          final question = assessment.currentQuestion;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Question $number of $total'),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: number / total),
                  const SizedBox(height: 24),
                  Text(
                    question.text,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  for (var i = 0; i < question.options.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                        ),
                        onPressed: () => _select(context, i),
                        child: Text(question.options[i].text),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
