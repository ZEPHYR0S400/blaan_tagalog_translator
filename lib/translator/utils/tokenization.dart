List<String> tokenize(String input) {
  final RegExp exp = RegExp(r"[A-Za-z'’]+|[^A-Za-z\s'’]+|\s+");
  return exp.allMatches(input).map((m) => m.group(0)!).toList();
}

String normalizeToken(String token) {
  final String lower = token.toLowerCase();
  final String stripped =
      lower.replaceAll(RegExp(r"(^[^A-Za-z'’]+)|([^A-Za-z'’]+$)"), '');
  return stripped;
}

bool isPunctuationOnly(String token) {
  return RegExp(r'^[^A-Za-z]+$').hasMatch(token);
}


