import 'package:json_annotation/json_annotation.dart';
import '../src.dart';

part 'question_list_response.g.dart';

@JsonSerializable()
class QuestionListResponse {
  QuestionListResponse(this.items, this.hasMore);

  /// ----- Properties -----

  List<Question> items;
  @JsonKey(name: 'has_more')
  bool hasMore;

  /// ----- Functions -----

  factory QuestionListResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionListResponseToJson(this);
}
