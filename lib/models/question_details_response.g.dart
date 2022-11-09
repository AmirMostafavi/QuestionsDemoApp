// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDetailsResponse _$QuestionDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionDetailsResponse(
      (json['items'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['has_more'] as bool,
    );

Map<String, dynamic> _$QuestionDetailsResponseToJson(
        QuestionDetailsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'has_more': instance.hasMore,
    };
