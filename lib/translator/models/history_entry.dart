import 'package:blaan_traslator/translator/services/translation_service.dart';
import 'package:hive/hive.dart';

part 'history_entry.g.dart';

@HiveType(typeId: 0)
class HistoryEntry extends HiveObject {
  HistoryEntry({
    required this.sourceText,
    required this.translatedText,
    required this.direction,
    required this.timestamp,
  });

  @HiveField(0)
  String sourceText;

  @HiveField(1)
  String translatedText;

  @HiveField(2)
  TranslationDirection direction;

  @HiveField(3)
  DateTime timestamp;
}
