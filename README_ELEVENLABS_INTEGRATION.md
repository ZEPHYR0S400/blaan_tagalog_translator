# ElevenLabs API Integration

This document describes the ElevenLabs API integration for text-to-speech (TTS) and speech-to-text (STT) functionality in the Blaan Translator app.

## Overview

The integration provides:
- **Text-to-Speech (TTS)**: High-quality AI voice synthesis using ElevenLabs
- **Speech-to-Text (STT)**: Accurate speech transcription using ElevenLabs
- **Fallback Support**: Automatic fallback to Flutter TTS if ElevenLabs is unavailable
- **Voice Management**: Voice selection and customization
- **Error Handling**: Comprehensive error handling and user feedback

## API Key

The integration uses the provided API key: `sk_778e74fdf0d60c0d1cb7cdfceec5b67c15dc16e95e9f23fb`

## Architecture

### Core Services

1. **ElevenLabsService** (`lib/services/elevenlabs_service.dart`)
   - Direct API communication with ElevenLabs
   - TTS and STT functionality
   - Voice management
   - Error handling

2. **EnhancedTTSService** (`lib/services/enhanced_tts_service.dart`)
   - Integrates ElevenLabs TTS with Flutter TTS
   - Automatic fallback mechanism
   - Voice settings management
   - Singleton pattern for global access

3. **EnhancedSTTService** (`lib/services/enhanced_stt_service.dart`)
   - Integrates ElevenLabs STT with audio recording
   - Permission handling
   - Recording state management
   - Transcription processing

4. **AudioRecordingService** (`lib/services/audio_recording_service.dart`)
   - Audio recording functionality
   - Permission management
   - File handling
   - Recording state tracking

5. **AudioPlaybackService** (`lib/services/audio_playback_service.dart`)
   - Audio playback for TTS output
   - Volume control
   - Playback state management
   - File cleanup

### UI Components

1. **VoiceSelectionSheet** (`lib/translator/widgets/voice_selection_sheet.dart`)
   - Voice selection interface
   - Voice settings customization
   - Provider selection (ElevenLabs vs Flutter TTS)

2. **Enhanced Translator Screen** (`lib/translator/translator_screen.dart`)
   - Microphone button for STT
   - TTS playback button
   - Recording state indicators
   - Error feedback

## Features

### Text-to-Speech (TTS)

- **High-Quality Voices**: Access to ElevenLabs' premium AI voices
- **Voice Customization**: Adjust stability, similarity boost, style, and speaker boost
- **Language Support**: Optimized for Filipino/Tagalog and English
- **Fallback Support**: Automatic fallback to Flutter TTS if ElevenLabs fails
- **Real-time Playback**: Immediate audio playback of generated speech

### Speech-to-Text (STT)

- **Accurate Transcription**: High-quality speech recognition
- **Language Detection**: Automatic language detection based on translation direction
- **Real-time Recording**: Visual feedback during recording
- **Automatic Translation**: Seamless integration with translation workflow
- **Error Handling**: Comprehensive error messages and recovery

### Voice Management

- **Voice Selection**: Choose from available ElevenLabs voices
- **Settings Customization**: Fine-tune voice parameters
- **Provider Switching**: Toggle between ElevenLabs and Flutter TTS
- **Persistent Settings**: Settings are maintained across app sessions

## Usage

### TTS Usage

```dart
// Initialize the service
final ttsService = EnhancedTTSService();
await ttsService.initialize();

// Speak text
await ttsService.speak("Hello, this is a test");

// Stop speaking
await ttsService.stop();

// Set voice settings
ttsService.setVoiceSettings({
  'stability': 0.8,
  'similarity_boost': 0.7,
  'style': 0.3,
  'use_speaker_boost': true,
});
```

### STT Usage

```dart
// Initialize the service
final sttService = EnhancedSTTService();
await sttService.initialize();

// Start recording
await sttService.startRecording();

// Stop recording and get transcription
final transcription = await sttService.stopRecordingAndTranscribe(
  languageCode: 'fil', // Filipino
);

print('Transcribed text: ${transcription.text}');
```

## Configuration

### Voice Settings

- **Stability** (0.0 - 1.0): Controls voice consistency
- **Similarity Boost** (0.0 - 1.0): Controls voice similarity to original
- **Style** (0.0 - 1.0): Controls voice expressiveness
- **Speaker Boost** (boolean): Enhances voice clarity

### Language Codes

- **Filipino/Tagalog**: `'fil'`
- **English**: `'en'`
- **Blaan**: Uses English as fallback (`'en'`)

## Error Handling

The integration includes comprehensive error handling:

1. **Network Errors**: Automatic retry and fallback mechanisms
2. **Permission Errors**: Clear user guidance for microphone permissions
3. **API Errors**: Detailed error messages with recovery suggestions
4. **Service Errors**: Graceful degradation to alternative services

## Dependencies

The integration requires the following dependencies:

```yaml
dependencies:
  # Audio recording and playback
  record: ^5.1.2
  audioplayers: ^6.1.0
  path_provider: ^2.1.4
  permission_handler: ^11.3.1
  
  # HTTP requests
  http: ^1.5.0
  
  # Existing TTS
  flutter_tts: ^3.8.5
```

## Testing

Run the integration tests:

```bash
flutter test test/elevenlabs_integration_test.dart
```

The tests validate:
- Service initialization
- Voice settings management
- Provider switching
- Recording state tracking
- Error handling

## Troubleshooting

### Common Issues

1. **Microphone Permission Denied**
   - Ensure microphone permission is granted in device settings
   - The app will prompt for permission on first use

2. **ElevenLabs API Errors**
   - Check API key validity
   - Verify network connectivity
   - Check API quota limits

3. **Audio Playback Issues**
   - Ensure device volume is not muted
   - Check audio output device selection
   - Verify audio file format compatibility

4. **Recording Issues**
   - Ensure microphone is not being used by another app
   - Check device microphone functionality
   - Verify recording permissions

### Debug Information

Enable debug logging by checking the console output for detailed error messages and service status information.

## Security Considerations

- API key is embedded in the code for this implementation
- In production, consider using environment variables or secure storage
- Audio files are temporarily stored and automatically cleaned up
- No sensitive data is persisted beyond the current session

## Performance Considerations

- Audio files are cached temporarily for playback
- Automatic cleanup prevents storage bloat
- Network requests are optimized with appropriate timeouts
- Fallback mechanisms ensure app responsiveness

## Future Enhancements

Potential improvements for future versions:

1. **Voice Cloning**: Support for custom voice creation
2. **Batch Processing**: Multiple audio file processing
3. **Offline Support**: Local TTS/STT capabilities
4. **Advanced Settings**: More granular voice customization
5. **Analytics**: Usage tracking and optimization

