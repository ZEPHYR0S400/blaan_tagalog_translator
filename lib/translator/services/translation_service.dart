import 'package:blaan_traslator/translator/data/tagalog_to_blaan.dart';
import 'package:blaan_traslator/translator/models/translation_result.dart';
import 'package:blaan_traslator/translator/utils/tokenization.dart';
import 'package:blaan_traslator/translator/utils/casing.dart';
import 'package:hive/hive.dart';

part 'translation_service.g.dart';

@HiveType(typeId: 1)
enum TranslationDirection {
  @HiveField(0)
  tagalogToBlaan,
  @HiveField(1)
  blaanToTagalog,
}

class TranslationService {
  const TranslationService();

  int get tagalogToBlaanCount => tagalogToBlaan.length;

  Map<String, String> get _blaanToTagalog => {
    for (final entry in tagalogToBlaan.entries) entry.value: entry.key,
  };

  TranslationResult translate(String input, TranslationDirection direction) {
    final Map<String, String> dictionary =
        direction == TranslationDirection.tagalogToBlaan
        ? tagalogToBlaan
        : _blaanToTagalog;

    final List<String> unknownTokens = <String>[];
    
    // Get all phrase keys sorted by length (longest first)
    final List<String> phraseKeys = dictionary.keys
        .where((key) => key.contains(' '))
        .toList()
      ..sort((a, b) => b.length.compareTo(a.length));
    
    // Try to match phrases first
    String result = input.toLowerCase();
    String output = input;
    
    for (final phrase in phraseKeys) {
      final RegExp phrasePattern = RegExp(
        '\\b${RegExp.escape(phrase)}\\b',
        caseSensitive: false,
      );
      
      if (phrasePattern.hasMatch(result)) {
        final String? translated = dictionary[phrase];
        if (translated != null) {
          output = output.replaceAllMapped(
            RegExp('\\b${RegExp.escape(phrase)}\\b', caseSensitive: false),
            (match) => translated,
          );
          // Mark as translated in lowercase version
          result = result.replaceAll(phrasePattern, '');
        }
      }
    }
    
    // If entire input was a phrase match, return it
    if (result.trim().isEmpty || result.replaceAll(RegExp(r'[^\w]'), '').isEmpty) {
      return TranslationResult(
        translatedText: output,
        unknownTokens: unknownTokens,
      );
    }
    
    // Otherwise, do word-by-word translation for remaining text
    final List<String> tokens = tokenize(input);
    final List<String> outputTokens = <String>[];

    for (final token in tokens) {
      final String normalized = normalizeToken(token);
      if (normalized.isEmpty) {
        outputTokens.add(token);
        continue;
      }

      final String? translated = dictionary[normalized];
      if (translated != null) {
        outputTokens.add(matchCasing(token, translated));
      } else {
        outputTokens.add(token);
        if (!isPunctuationOnly(token)) {
          unknownTokens.add(token);
        }
      }
    }

    return TranslationResult(
      translatedText: outputTokens.join(''),
      unknownTokens: unknownTokens,
    );
  }
}
