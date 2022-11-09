import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src.dart';

void main() async {
  /// Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(QuestionDetailsAdapter());
  Hive.registerAdapter(AnswerAdapter());
  Hive.registerAdapter(ProfileAdapter());
  await Hive.openBox<Question>("question");
  await Hive.openBox<QuestionDetails>("question_details");

  /// Run the Application
  runApp(const QuestionApp());
}

class QuestionApp extends StatelessWidget {
  const QuestionApp({super.key});

  /// ----- Widget Lifecycle -----

  @override
  Widget build(BuildContext context) {
    /// Limit device orientation to portrait
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    /// --- App ---
    return CupertinoApp(
      title: AppStrings.appName,

      /// ----- Routes -----
      initialRoute: '/',
      routes: {
        AppRoutes.homeRoute: (context) => const HomeScreenWidget(),
        AppRoutes.questionsRoute: (context) => const QuestionsListScreenWidget(),
        AppRoutes.questionDetailsRoute: (context) => const QuestionDetailsScreenWidget(),
      },
    );
  }
}