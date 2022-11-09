// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnswerAdapter extends TypeAdapter<Answer> {
  @override
  final int typeId = 3;

  @override
  Answer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Answer(
      fields[0] as int?,
      fields[1] as int?,
      fields[2] as int?,
      fields[3] as int?,
      fields[4] as int?,
      fields[5] as Profile?,
    );
  }

  @override
  void write(BinaryWriter writer, Answer obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.answerId)
      ..writeByte(2)
      ..write(obj.creationDate)
      ..writeByte(3)
      ..write(obj.lastActivityDate)
      ..writeByte(4)
      ..write(obj.score)
      ..writeByte(5)
      ..write(obj.owner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      json['question_id'] as int?,
      json['answer_id'] as int?,
      json['creation_date'] as int?,
      json['last_activity_date'] as int?,
      json['score'] as int?,
      json['owner'] == null
          ? null
          : Profile.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'answer_id': instance.answerId,
      'creation_date': instance.creationDate,
      'last_activity_date': instance.lastActivityDate,
      'score': instance.score,
      'owner': instance.owner,
    };
