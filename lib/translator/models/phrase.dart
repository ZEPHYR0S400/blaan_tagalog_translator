class Phrase {
  const Phrase({
    required this.category,
    required this.word,
    required this.pronunciation,
    required this.translation,
  });

  final String category; // e.g., Personal, Greetings
  final String word; // e.g., Ngalan
  final String pronunciation; // e.g., NGA-lan
  final String translation; // e.g., pangalan
}
