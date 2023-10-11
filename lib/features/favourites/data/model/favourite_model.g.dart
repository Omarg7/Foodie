// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteModelAdapter extends TypeAdapter<FavouriteModel> {
  @override
  final int typeId = 100;

  @override
  FavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteModel(
      uid: fields[14] as String,
      name: fields[8] as String,
      category: fields[1] as String,
      area: fields[0] as String,
      mealId: fields[6] as int,
      instructions: (fields[5] as List).cast<String>(),
      thumbnail: fields[12] as String,
      tags: (fields[11] as List).cast<String>(),
      youtubeLink: fields[13] as String,
      ingredients: (fields[4] as List).cast<String>(),
      measures: (fields[7] as List).cast<String>(),
      recipeLink: fields[9] as String,
      imageSource: fields[3] as String?,
      strCreativeCommonsConfirmed: fields[10] as String?,
      dateModified: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.area)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.dateModified)
      ..writeByte(3)
      ..write(obj.imageSource)
      ..writeByte(4)
      ..write(obj.ingredients)
      ..writeByte(5)
      ..write(obj.instructions)
      ..writeByte(6)
      ..write(obj.mealId)
      ..writeByte(7)
      ..write(obj.measures)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.recipeLink)
      ..writeByte(10)
      ..write(obj.strCreativeCommonsConfirmed)
      ..writeByte(11)
      ..write(obj.tags)
      ..writeByte(12)
      ..write(obj.thumbnail)
      ..writeByte(13)
      ..write(obj.youtubeLink)
      ..writeByte(14)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
