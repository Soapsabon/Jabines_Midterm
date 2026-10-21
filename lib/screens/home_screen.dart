import 'package:flutter/material.dart';

import '../data/student_info.dart';
import '../state/assessment_controller.dart';
import '../state/theme_controller.dart';
import 'assessment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.assessment,
    required this.themeController,
  });

  final AssessmentController assessment;
  final ThemeController themeController;

  void _start(BuildContext context) {
    assessment.restart();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AssessmentScreen(assessment: assessment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.dark_mode),
          Switch(value: isDark, onChanged: themeController.setDark),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Campus Wellness Tracker',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              const Text('Evaluate your current study-life balance.'),
              const SizedBox(height: 24),
              Text(kStudent.name, style: theme.textTheme.titleMedium),
              Text(kStudent.program),
              Text(kStudent.school),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _start(context),
                child: const Text('Start Assessment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
