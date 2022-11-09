// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerListResponse _$AnswerListResponseFromJson(Map<String, dynamic> json) =>
    AnswerListResponse(
      (json['items'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['has_more'] as bool,
    );

Map<String, dynamic> _$AnswerListResponseToJson(AnswerListResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'has_more': instance.hasMore,
    };
