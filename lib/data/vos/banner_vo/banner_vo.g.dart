// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BannerVOAdapter extends TypeAdapter<BannerVO> {
  @override
  final int typeId = 1;

  @override
  BannerVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannerVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BannerVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.bannerId)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.action)
      ..writeByte(3)
      ..write(obj.bannerText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
