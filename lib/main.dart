import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'state/assessment_controller.dart';
import 'state/theme_controller.dart';

void main() {
  runApp(const CampusWellnessApp());
}

class CampusWellnessApp extends StatefulWidget {
  const CampusWellnessApp({super.key});

  @override
  State<CampusWellnessApp> createState() => _CampusWellnessAppState();
}

class _CampusWellnessAppState extends State<CampusWellnessApp> {
  final ThemeController _themeController = ThemeController();
  final AssessmentController _assessment = AssessmentController();

  @override
  void dispose() {
    _themeController.dispose();
    _assessment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeController,
      builder: (context, _) => MaterialApp(
        title: 'Campus Wellness Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.teal),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.teal,
          brightness: Brightness.dark,
        ),
        themeMode: _themeController.mode,
        home: HomeScreen(
          assessment: _assessment,
          themeController: _themeController,
        ),
      ),
    );
  }
}
