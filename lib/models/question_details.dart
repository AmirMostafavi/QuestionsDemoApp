import 'package:hive/hive.dart';

import 'src.dart';

part 'question_details.g.dart';

@HiveType(typeId: 1)
class QuestionDetails {
  QuestionDetails(this.question, this.answers);

  /// ----- Properties -----

  @HiveField(0)
  Question question;
  @HiveField(1)
  List<Answer> answers;

}
