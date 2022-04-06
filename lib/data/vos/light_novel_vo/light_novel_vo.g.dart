// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_novel_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LightNovelVOAdapter extends TypeAdapter<LightNovelVO> {
  @override
  final int typeId = 3;

  @override
  LightNovelVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LightNovelVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LightNovelVO obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.lightnovelId)
      ..writeByte(1)
      ..write(obj.chptCount)
      ..writeByte(2)
      ..write(obj.lightnovelTitle)
      ..writeByte(3)
      ..write(obj.lightnovelCover)
      ..writeByte(4)
      ..write(obj.lightnovelDisp)
      ..writeByte(5)
      ..write(obj.lightnovelLikeCount)
      ..writeByte(6)
      ..write(obj.created)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(8)
      ..write(obj.categoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LightNovelVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
