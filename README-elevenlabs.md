# ElevenLabs Integration (TTS + STT)

This project includes a lightweight ElevenLabs client for Text-to-Speech (TTS) and Speech-to-Text (STT) with proper authentication and error handling.

## Setup

- Add your ElevenLabs API key securely. Prefer passing via `--dart-define`:
  - `flutter run --dart-define=ELEVENLABS_API_KEY=YOUR_API_KEY`
  - Or set in code when instantiating `ElevenLabsService(apiKey: ...)`.
- Ensure dependency `http` is installed (already added).

## Usage

```dart
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:blaan_traslator/services/elevenlabs_service.dart';

void example() async {
  const apiKey = String.fromEnvironment('ELEVENLABS_API_KEY');
  if (apiKey.isEmpty) { throw Exception('Set ELEVENLABS_API_KEY via --dart-define'); }\n  final eleven = ElevenLabsService(apiKey: apiKey);

  // TTS: synthesize speech, returns audio bytes (mp3 by default)
  final audio = await eleven.tts(
    voiceId: '21m00Tcm4TlvDq8ikWAM',
    text: 'Hello from ElevenLabs!',
    outputFormat: 'mp3_44100_128',
    modelId: 'eleven_multilingual_v2',
  );
  // Save or play `audio` with your preferred player.

  // STT: transcribe bytes
  final wavBytes = await rootBundle.load('assets/sample.wav').then((b) => b.buffer.asUint8List());
  final tx = await eleven.sttFromBytes(audioBytes: wavBytes, languageCode: 'en');
  print(tx.text);

  eleven.dispose();
}
```

## API

- `tts({voiceId, text, modelId?, outputFormat?, voiceSettings?}) -> Uint8List`
  - Produces audio bytes, suitable to write to file or stream to a player.
- `sttFromBytes({audioBytes, filename?, modelId?, languageCode?}) -> TranscriptionResponse`
  - Returns `text`, optional `languageCode`, and `raw` JSON.
- `sttFromFilePath({path, modelId?, languageCode?}) -> TranscriptionResponse`

## Error Handling

Errors are thrown as `ApiException` including `statusCode` and any message from ElevenLabs (`detail` or `error`). Wrap calls with try/catch as needed.

## Notes

- Default STT model is `scribe_v1`.
- Default TTS output format is `mp3_44100_128`; adjust to your needs.
- Avoid committing secrets; prefer `--dart-define` or platform-specific secure storage.
