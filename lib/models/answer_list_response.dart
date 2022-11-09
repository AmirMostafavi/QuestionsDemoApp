import 'package:json_annotation/json_annotation.dart';
import '../src.dart';

part 'answer_list_response.g.dart';

@JsonSerializable()
class AnswerListResponse {
  AnswerListResponse(this.items, this.hasMore);

  /// ----- Properties -----

  List<Answer> items;
  @JsonKey(name: 'has_more')
  bool hasMore;

  /// ----- Functions -----

  factory AnswerListResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerListResponseToJson(this);
}
