// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionListResponse _$QuestionListResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionListResponse(
      (json['items'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['has_more'] as bool,
    );

Map<String, dynamic> _$QuestionListResponseToJson(
        QuestionListResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'has_more': instance.hasMore,
    };
