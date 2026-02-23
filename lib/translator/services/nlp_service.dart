class LexiconEntry {
  LexiconEntry(this.token, this.tag);
  final String token; // normalized token
  final String tag; // simple POS-like tag: noun, verb, etc.
}

class NLPService {
  NLPService({required Map<String, String> dictionary})
    : _dictionary = dictionary;

  final Map<String, String> _dictionary;

  // Bigram counts for a toy statistical model; can be expanded.
  final Map<String, Map<String, int>> _bigramCounts = {};

  void observeSentence(List<String> tokens) {
    for (int i = 0; i < tokens.length - 1; i++) {
      final String a = tokens[i].toLowerCase();
      final String b = tokens[i + 1].toLowerCase();
      _bigramCounts.putIfAbsent(a, () => {});
      _bigramCounts[a]![b] = (_bigramCounts[a]![b] ?? 0) + 1;
    }
  }

  // Predict the most likely next token given the previous one.
  String? predictNext(String previousToken) {
    final Map<String, int>? options =
        _bigramCounts[previousToken.toLowerCase()];
    if (options == null || options.isEmpty) return null;
    String? best;
    int bestCount = -1;
    options.forEach((token, count) {
      if (count > bestCount) {
        best = token;
        bestCount = count;
      }
    });
    return best;
  }

  // Suggest translations for unknown tokens using edit distance nearest from dictionary keys.
  List<String> suggestSimilar(String token, {int maxSuggestions = 3}) {
    final String t = token.toLowerCase();
    final List<MapEntry<String, int>> distances =
        _dictionary.keys.map((k) => MapEntry(k, _levenshtein(t, k))).toList()
          ..sort((a, b) => a.value.compareTo(b.value));
    return distances.take(maxSuggestions).map((e) => e.key).toList();
  }

  int _levenshtein(String a, String b) {
    final int n = a.length;
    final int m = b.length;
    if (n == 0) return m;
    if (m == 0) return n;
    final List<int> prev = List<int>.generate(m + 1, (i) => i);
    final List<int> curr = List<int>.filled(m + 1, 0);
    for (int i = 1; i <= n; i++) {
      curr[0] = i;
      for (int j = 1; j <= m; j++) {
        final int cost = a[i - 1] == b[j - 1] ? 0 : 1;
        curr[j] = [
          curr[j - 1] + 1,
          prev[j] + 1,
          prev[j - 1] + cost,
        ].reduce((x, y) => x < y ? x : y);
      }
      for (int j = 0; j <= m; j++) {
        prev[j] = curr[j];
      }
    }
    return prev[m];
  }
}
