import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ElevenLabsService {
  const ElevenLabsService({required this.apiKey});

  final String apiKey;

  // Available voice IDs from ElevenLabs
  // Male voices
  static const String voiceMale1 =
      'ErXwobaYiN019PkySvjV'; // Antoni - well-rounded, pleasant
  static const String voiceMale2 =
      'pNInz6obpgDQGcFmaJgB'; // Adam - deep, resonant
  static const String voiceMale3 =
      'VR6AewLTigWG4xSOukaG'; // Arnold - crisp, clear
  static const String voiceMale4 =
      'yoZ06aMxZJJ28mfd3POQ'; // Sam - dynamic, raspy

  // Female voices
  static const String voiceFemale1 =
      '21m00Tcm4TlvDq8ikWAM'; // Rachel - calm, narration
  static const String voiceFemale2 =
      'EXAVITQu4vr4xnSDxMaL'; // Bella - soft, pleasant
  static const String voiceFemale3 =
      'MF3mGyEYCl7XYWbV9V6O'; // Elli - emotional, young

  // Default voice
  static const String _defaultVoiceId = voiceMale1;

  Future<File> textToSpeech({
    required String text,
    String voiceId = _defaultVoiceId,
    double stability = 0.5,
    double similarityBoost = 0.5,
    double style = 0.0,
    bool speakerBoost = true,
  }) async {
    final Uri url = Uri.parse(
      'https://api.elevenlabs.io/v1/text-to-speech/$voiceId/stream',
    );

    final Map<String, String> headers = {
      'Accept': 'audio/mpeg',
      'xi-api-key': apiKey,
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> body = {
      'text': text,
      'model_id': 'eleven_multilingual_v2',
      'voice_settings': {
        'stability': stability,
        'similarity_boost': similarityBoost,
        'style': style,
        'use_speaker_boost': speakerBoost,
      },
    };

    final http.Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode != 200) {
      throw HttpException(
        'TTS failed: ${response.statusCode} ${response.body}',
      );
    }

    final Directory tempDir = await getTemporaryDirectory();
    final File out = File(
      '${tempDir.path}/tts_${DateTime.now().millisecondsSinceEpoch}.mp3',
    );
    await out.writeAsBytes(response.bodyBytes);
    return out;
  }

  // Simple STT using ElevenLabs Realtime transcription endpoint (Batch).
  // Expects a WAV/MP3 file path and returns the transcribed text.
  // Only accepts Filipino/Tagalog language.
  Future<String> speechToText({
    required File audioFile,
    String model = 'scribe_v1',
    String? languageCode,
  }) async {
    final Uri url = Uri.parse('https://api.elevenlabs.io/v1/speech-to-text');

    final http.MultipartRequest req = http.MultipartRequest('POST', url)
      ..headers['xi-api-key'] = apiKey
      ..fields['model_id'] = model;

    // Force Filipino/Tagalog language only
    req.fields['language'] = languageCode ?? 'fil';

    req.files.add(await http.MultipartFile.fromPath('file', audioFile.path));

    final http.StreamedResponse streamed = await req.send();
    final http.Response res = await http.Response.fromStream(streamed);
    if (res.statusCode != 200) {
      throw HttpException('STT failed: ${res.statusCode} ${res.body}');
    }
    final Map<String, dynamic> data =
        jsonDecode(res.body) as Map<String, dynamic>;

    final String transcribedText = (data['text'] as String?) ?? '';

    // Validate that the text contains ONLY Latin/Filipino characters
    // Reject any non-Latin scripts (Korean, Chinese, Japanese, Hindi, etc.)
    if (transcribedText.isNotEmpty) {
      if (_containsNonLatinScript(transcribedText)) {
        throw HttpException(
          'Non-Tagalog/Blaan language detected. Please speak in Tagalog or Blaan only',
        );
      }

      // Additional check: Ensure text contains at least some Latin characters
      if (!_containsLatinCharacters(transcribedText)) {
        throw HttpException(
          'No Tagalog or Blaan text detected. Please speak in Tagalog or Blaan only',
        );
      }
    }

    return transcribedText;
  }

  // Helper method to detect non-Latin scripts
  bool _containsNonLatinScript(String text) {
    // Check for:
    // - Korean (Hangul): \u1100-\u11FF, \uAC00-\uD7AF
    // - Chinese (CJK): \u4E00-\u9FFF
    // - Japanese (Hiragana/Katakana): \u3040-\u309F, \u30A0-\u30FF
    // - Hindi/Devanagari: \u0900-\u097F
    // - Arabic: \u0600-\u06FF
    // - Thai: \u0E00-\u0E7F
    // - Bengali: \u0980-\u09FF
    final nonLatinPattern = RegExp(
      r'[\u0600-\u06FF\u0900-\u097F\u0980-\u09FF\u0E00-\u0E7F\u1100-\u11FF\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF\uAC00-\uD7AF]',
    );
    return nonLatinPattern.hasMatch(text);
  }

  // Helper method to check if text contains Latin characters
  bool _containsLatinCharacters(String text) {
    // Check for basic Latin alphabet (a-z, A-Z) and common Filipino characters
    final latinPattern = RegExp(r'[a-zA-Z]');
    return latinPattern.hasMatch(text);
  }
}
