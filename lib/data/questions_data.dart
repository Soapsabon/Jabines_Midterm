import '../models/question.dart';

/// Wellness questions. Higher score = healthier habit.
/// 6 questions x max 4 points = 24 maximum.
const List<Question> kQuestions = [
  Question(
    category: 'Sleep',
    text: 'How many hours do you typically sleep each night?',
    options: [
      AnswerOption(text: 'Less than 4 hours', score: 1),
      AnswerOption(text: '4-6 hours', score: 2),
      AnswerOption(text: '7-8 hours', score: 4),
      AnswerOption(text: 'More than 8 hours', score: 3),
    ],
  ),
  Question(
    category: 'Hydration',
    text: 'How many glasses of water do you drink in a day?',
    options: [
      AnswerOption(text: '1-2 glasses', score: 1),
      AnswerOption(text: '3-4 glasses', score: 2),
      AnswerOption(text: '5-7 glasses', score: 3),
      AnswerOption(text: '8 or more glasses', score: 4),
    ],
  ),
  Question(
    category: 'Activity',
    text: 'How many days a week do you exercise or stay physically active?',
    options: [
      AnswerOption(text: 'Never', score: 1),
      AnswerOption(text: '1-2 days', score: 2),
      AnswerOption(text: '3-4 days', score: 3),
      AnswerOption(text: '5 or more days', score: 4),
    ],
  ),
  Question(
    category: 'Stress',
    text: 'How would you describe your stress level this week?',
    options: [
      AnswerOption(text: 'Overwhelming', score: 1),
      AnswerOption(text: 'High', score: 2),
      AnswerOption(text: 'Manageable', score: 3),
      AnswerOption(text: 'Low', score: 4),
    ],
  ),
  Question(
    category: 'Study Balance',
    text: 'How do you handle breaks while studying?',
    options: [
      AnswerOption(text: 'I study for hours without stopping', score: 1),
      AnswerOption(text: 'I rarely take breaks', score: 2),
      AnswerOption(text: 'I take occasional breaks', score: 3),
      AnswerOption(text: 'I take regular short breaks', score: 4),
    ],
  ),
  Question(
    category: 'Nutrition',
    text: 'How regularly do you eat balanced meals?',
    options: [
      AnswerOption(text: 'I often skip meals', score: 1),
      AnswerOption(text: 'Mostly snacks or fast food', score: 2),
      AnswerOption(text: 'Balanced meals most days', score: 3),
      AnswerOption(text: 'Balanced meals every day', score: 4),
    ],
  ),
];
