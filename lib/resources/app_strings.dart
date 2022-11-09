import 'package:json_annotation/json_annotation.dart';

part 'app_strings.g.dart';

@JsonSerializable()
class AppStrings{
  /// ----- Application Name -----
  static const appName = 'Questions App';

  /// ----- Home Screen -----
  static const homeTitle = 'Welcome to Questions';
  static const homeSubtitle = 'A Demo Application';
  static const homeQuestionsCta = 'Go to Questions';

  /// ----- Questions Screen -----
  static const questions = 'Questions';
  static const question = 'Question';
  static const answers = 'Answers';
  static const createdAt = 'Created At';

  /// ----- QuestionDetails Screen -----
  static const questionDetails = 'Question Details';

}