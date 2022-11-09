// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 0;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as int?,
      fields[4] as int?,
      fields[5] as int?,
      fields[6] as int?,
      (fields[7] as List?)?.cast<String>(),
      fields[8] as Profile?,
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.answerCount)
      ..writeByte(4)
      ..write(obj.viewCount)
      ..writeByte(5)
      ..write(obj.creationDate)
      ..writeByte(6)
      ..write(obj.lastActivityDate)
      ..writeByte(7)
      ..write(obj.tags)
      ..writeByte(8)
      ..write(obj.owner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['question_id'] as int?,
      json['title'] as String?,
      json['link'] as String?,
      json['answer_count'] as int?,
      json['view_count'] as int?,
      json['creation_date'] as int?,
      json['last_activity_date'] as int?,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['owner'] == null
          ? null
          : Profile.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question_id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'answer_count': instance.answerCount,
      'view_count': instance.viewCount,
      'creation_date': instance.creationDate,
      'last_activity_date': instance.lastActivityDate,
      'tags': instance.tags,
      'owner': instance.owner,
    };
