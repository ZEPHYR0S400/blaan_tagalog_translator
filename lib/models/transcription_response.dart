class TranscriptionResponse {
  final String text;
  final String? languageCode;
  final Map<String, dynamic> raw;

  TranscriptionResponse({required this.text, this.languageCode, required this.raw});

  factory TranscriptionResponse.fromJson(Map<String, dynamic> json) {
    return TranscriptionResponse(
      text: json['text'] ?? '',
      languageCode: json['language_code'] as String?,
      raw: json,
    );
  }
}