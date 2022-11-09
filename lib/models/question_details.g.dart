// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionDetailsAdapter extends TypeAdapter<QuestionDetails> {
  @override
  final int typeId = 1;

  @override
  QuestionDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionDetails(
      fields[0] as Question,
      (fields[1] as List).cast<Answer>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
