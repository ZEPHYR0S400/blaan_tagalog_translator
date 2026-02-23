import 'package:hive_flutter/hive_flutter.dart';
import 'package:blaan_traslator/translator/models/history_entry.dart';
import 'package:blaan_traslator/translator/services/translation_service.dart';

class HiveService {
  static const String _historyBoxName = 'history';
  static Box<HistoryEntry>? _historyBox;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    
    // Register adapters
    Hive.registerAdapter(HistoryEntryAdapter());
    Hive.registerAdapter(TranslationDirectionAdapter());
    
    // Open boxes
    _historyBox = await Hive.openBox<HistoryEntry>(_historyBoxName);
  }

  static Box<HistoryEntry> get historyBox {
    if (_historyBox == null) {
      throw StateError('HiveService not initialized. Call initialize() first.');
    }
    return _historyBox!;
  }

  // Add a new history entry
  static Future<void> addHistoryEntry(HistoryEntry entry) async {
    await historyBox.add(entry);
  }

  // Get all history entries
  static List<HistoryEntry> getAllHistoryEntries() {
    return historyBox.values.toList();
  }

  // Get history entries sorted by timestamp (newest first)
  static List<HistoryEntry> getSortedHistoryEntries() {
    final entries = getAllHistoryEntries();
    entries.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return entries;
  }

  // Clear all history
  static Future<void> clearHistory() async {
    await historyBox.clear();
  }

  // Delete a specific history entry
  static Future<void> deleteHistoryEntry(int index) async {
    await historyBox.deleteAt(index);
  }

  // Get history count
  static int getHistoryCount() {
    return historyBox.length;
  }

  // Close the database
  static Future<void> close() async {
    await _historyBox?.close();
  }
}
