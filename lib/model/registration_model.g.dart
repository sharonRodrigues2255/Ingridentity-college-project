// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRegModelAdapter extends TypeAdapter<UserRegModel> {
  @override
  final int typeId = 1;

  @override
  UserRegModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRegModel(
      email: fields[0] as String,
      username: fields[1] as String,
      password: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserRegModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRegModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
