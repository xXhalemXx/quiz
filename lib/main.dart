import 'package:quiz/quiz_app.dart';

import 'src/core/config/config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //  Here we are calling the Dependency Injection
  await setupGetIt();
  //  This is the main app
  runApp(const QuizApp());
}
