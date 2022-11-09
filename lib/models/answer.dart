import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'src.dart';

part 'answer.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Answer {
  Answer(this.questionId, this.answerId, this.creationDate, this.lastActivityDate, this.score,
      this.owner);

  /// ----- Properties -----

  @HiveField(0)
  @JsonKey(name: 'question_id')
  int? questionId;
  @HiveField(1)
  @JsonKey(name: 'answer_id')
  int? answerId;
  @HiveField(2)
  @JsonKey(name: 'creation_date')
  int? creationDate;
  @HiveField(3)
  @JsonKey(name: 'last_activity_date')
  int? lastActivityDate;
  @HiveField(4)
  int? score;
  @HiveField(5)
  Profile? owner;

  /// ----- Functions -----

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
