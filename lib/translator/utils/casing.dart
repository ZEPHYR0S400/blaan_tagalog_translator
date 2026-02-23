String matchCasing(String original, String translated) {
  if (original == original.toUpperCase()) {
    return translated.toUpperCase();
  }
  if (original.isNotEmpty &&
      original[0] == original[0].toUpperCase() &&
      original.substring(1) == original.substring(1).toLowerCase()) {
    return translated.isEmpty
        ? translated
        : translated[0].toUpperCase() + translated.substring(1).toLowerCase();
  }
  return translated.toLowerCase();
}


