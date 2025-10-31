import 'package:quizz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion("Which language is used to write Flutter apps?", [
    "Dart",
    "Java",
    "Kotlin",
    "Swift",
  ]),
  QuizQuestion(
    "What widget is used to create a scrollable list of items in Flutter?",
    ["ListView", "Column", "Stack", "GridView"],
  ),
  QuizQuestion("Which method is used to rebuild the UI in a StatefulWidget?", [
    "setState()",
    "update()",
    "refresh()",
    "rebuild()",
  ]),
  QuizQuestion("What is the root widget of every Flutter app?", [
    "MaterialApp",
    "Scaffold",
    "Container",
    "WidgetApp",
  ]),
  QuizQuestion("What is the root widget of every Flutter app?", [
    "To define dependencies",
    "To store code",
    "To manage themes",
    "To write tests",
  ]),
  QuizQuestion("What is a StatelessWidget?", [
    "A widget that doesn't require mutable state",
    "A widget that can change its state",
    "A widget with animations",
    "A widget used only for layout",
  ]),
  QuizQuestion(
    "Which widget provides basic visual layout structure for Material apps?",
    ["Scaffold", "SafeArea", "Container", "AppBar"],
  ),
  QuizQuestion("Which Flutter command creates a new project?", [
    "flutter create",
    "flutter run",
    "flutter make",
    "flutter new",
  ]),
];
