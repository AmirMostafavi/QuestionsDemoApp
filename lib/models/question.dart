import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'src.dart';

part 'question.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Question {
  Question(this.id, this.title, this.link, this.answerCount, this.viewCount,
      this.creationDate, this.lastActivityDate, this.tags, this.owner);

  /// ----- Properties -----

  @HiveField(0)
  @JsonKey(name: 'question_id')
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? link;
  @HiveField(3)
  @JsonKey(name: 'answer_count')
  int? answerCount;
  @HiveField(4)
  @JsonKey(name: 'view_count')
  int? viewCount;
  @HiveField(5)
  @JsonKey(name: 'creation_date')
  int? creationDate;
  @HiveField(6)
  @JsonKey(name: 'last_activity_date')
  int? lastActivityDate;
  @HiveField(7)
  List<String>? tags;
  @HiveField(8)
  Profile? owner;

  /// ----- Functions -----

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
