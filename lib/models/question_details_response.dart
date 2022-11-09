import 'package:json_annotation/json_annotation.dart';
import '../src.dart';

part 'question_details_response.g.dart';

@JsonSerializable()
class QuestionDetailsResponse {
  QuestionDetailsResponse(this.items, this.hasMore);

  /// ----- Properties -----

  List<Answer> items;
  @JsonKey(name: 'has_more')
  bool hasMore;

  /// ----- Functions -----

  factory QuestionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDetailsResponseToJson(this);
}
