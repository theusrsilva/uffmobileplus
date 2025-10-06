// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discipline_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DisciplineAdapter extends TypeAdapter<Discipline> {
  @override
  final int typeId = 20;

  @override
  Discipline read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Discipline(
      cod: fields[0] as String?,
      codClass: fields[1] as String?,
      startTime: fields[2] as String?,
      endTime: fields[3] as String?,
      title: fields[4] as String?,
      status: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Discipline obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cod)
      ..writeByte(1)
      ..write(obj.codClass)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisciplineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
