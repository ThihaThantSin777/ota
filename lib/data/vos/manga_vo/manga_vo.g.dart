// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaVOAdapter extends TypeAdapter<MangaVO> {
  @override
  final int typeId = 2;

  @override
  MangaVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      isFavorite: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MangaVO obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.mangaId)
      ..writeByte(1)
      ..write(obj.chptCount)
      ..writeByte(2)
      ..write(obj.mangaTitle)
      ..writeByte(3)
      ..write(obj.mangaCover)
      ..writeByte(4)
      ..write(obj.mangaDisp)
      ..writeByte(5)
      ..write(obj.mangaLikeCount)
      ..writeByte(6)
      ..write(obj.created)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(8)
      ..write(obj.categoryName)
      ..writeByte(9)
      ..write(obj.draft)
      ..writeByte(10)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
