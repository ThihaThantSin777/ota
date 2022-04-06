// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleVOAdapter extends TypeAdapter<ArticleVO> {
  @override
  final int typeId = 4;

  @override
  ArticleVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleVO(
      artId: fields[0] as String?,
      artTitle: fields[1] as String?,
      artThumb: fields[2] as String?,
      artSum: fields[3] as String?,
      created: fields[4] as String?,
      categoryId: fields[5] as String?,
      categoryName: fields[6] as Object?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleVO obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.artId)
      ..writeByte(1)
      ..write(obj.artTitle)
      ..writeByte(2)
      ..write(obj.artThumb)
      ..writeByte(3)
      ..write(obj.artSum)
      ..writeByte(4)
      ..write(obj.created)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.categoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
