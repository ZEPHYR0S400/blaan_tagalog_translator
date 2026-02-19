// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationDirectionAdapter extends TypeAdapter<TranslationDirection> {
  @override
  final int typeId = 1;

  @override
  TranslationDirection read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TranslationDirection.tagalogToBlaan;
      case 1:
        return TranslationDirection.blaanToTagalog;
      default:
        return TranslationDirection.tagalogToBlaan;
    }
  }

  @override
  void write(BinaryWriter writer, TranslationDirection obj) {
    switch (obj) {
      case TranslationDirection.tagalogToBlaan:
        writer.writeByte(0);
        break;
      case TranslationDirection.blaanToTagalog:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationDirectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
