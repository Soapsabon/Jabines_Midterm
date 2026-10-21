import 'package:flutter/material.dart';

import '../models/wellness_result.dart';
import '../state/assessment_controller.dart';
import 'assessment_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.assessment});

  final AssessmentController assessment;

  void _restart(BuildContext context) {
    assessment.restart();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => AssessmentScreen(assessment: assessment),
      ),
    );
  }

  void _home(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final result = WellnessResult.fromScore(
      assessment.totalScore,
      assessment.maxScore,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Your Results'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                '${result.score} / ${result.maxScore}',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                result.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(result.recommendation, textAlign: TextAlign.center),
              const Divider(height: 32),
              for (final item in assessment.breakdown)
                ListTile(
                  dense: true,
                  title: Text(item.category),
                  trailing: Text('${item.score} / ${item.max}'),
                ),
              const SizedBox(height: 16),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () => _restart(context),
                    child: const Text('Restart'),
                  ),
                  OutlinedButton(
                    onPressed: () => _home(context),
                    child: const Text('Home'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
