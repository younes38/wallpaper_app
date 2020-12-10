// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Photo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 1;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      id: fields[0] as int,
      height: fields[1] as int,
      width: fields[2] as int,
      photographer: fields[5] as String,
      photographerId: fields[3] as int,
      photographerUrl: fields[6] as String,
      src: fields[8] as Src,
      url: fields[4] as String,
      liked: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.photographerId)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.photographer)
      ..writeByte(6)
      ..write(obj.photographerUrl)
      ..writeByte(7)
      ..write(obj.liked)
      ..writeByte(8)
      ..write(obj.src);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
