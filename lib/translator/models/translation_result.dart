class TranslationResult {
  TranslationResult({
    required this.translatedText,
    required List<String> unknownTokens,
  }) : unknownTokens = List.unmodifiable(unknownTokens);

  final String translatedText;
  final List<String> unknownTokens;
}
