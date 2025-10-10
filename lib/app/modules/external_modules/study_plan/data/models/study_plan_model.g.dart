// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_plan_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudyPlanModelAdapter extends TypeAdapter<StudyPlanModel> {
  @override
  final int typeId = 21;

  @override
  StudyPlanModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudyPlanModel(
      plan: (fields[0] as Map?)?.map((dynamic k, dynamic v) =>
          MapEntry(k as WeekDay, (v as List?)?.cast<Discipline>())),
    );
  }

  @override
  void write(BinaryWriter writer, StudyPlanModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.plan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudyPlanModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
