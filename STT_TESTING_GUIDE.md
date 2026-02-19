# STT (Speech-to-Text) Testing Guide

## What Was Fixed

### Issues Identified
1. **Silent Error Handling** - Errors were caught but not shown to users
2. **Wrong Audio Format** - Recording in M4A format, but ElevenLabs expects WAV/MP3
3. **No Permission Handling** - App silently failed when microphone permission was denied
4. **No User Feedback** - No error messages or status indicators
5. **No Auto-Translation** - Transcribed text wasn't automatically translated
6. **Memory Leak** - Temporary audio files weren't cleaned up

### Fixes Applied

#### 1. Changed Audio Format (Line 154-160)
```dart
// OLD: AudioEncoder.aacLc with .m4a extension
// NEW: AudioEncoder.wav with .wav extension
await _recorder.start(
  const RecordConfig(
    encoder: AudioEncoder.wav,
    bitRate: 128000,
    sampleRate: 16000,  // Optimized for speech
  ),
  path: filePath,
);
```

#### 2. Added Error Messages (Lines 100-124)
- Shows SnackBar when recording fails to save
- Shows SnackBar when no speech is detected
- Shows detailed error message when STT API fails
- Shows permission denied message

#### 3. Auto-Translation (Line 111)
```dart
if (text.isNotEmpty) {
  _inputController.text = text;
  await _performTranslation();  // NEW: Auto-translate after STT
}
```

#### 4. File Cleanup (Lines 130-132)
```dart
// Clean up the temporary audio file
try {
  await File(path).delete();
} catch (_) {}
```

#### 5. Better Visual Feedback (Lines 522-529)
- Shows "Recording..." text when recording
- Shows "Processing..." text when transcribing
- Red microphone icon when recording
- Spinner when processing
- Tooltip on microphone button

## How to Test STT

### Prerequisites
1. **Microphone** - Ensure your device has a working microphone
2. **Internet Connection** - ElevenLabs API requires internet
3. **API Key** - Already configured in the code

### Testing Steps

#### Test 1: Basic Recording
1. Launch the app: `flutter run -d windows`
2. Click the microphone icon in the input card
3. **Expected**: 
   - Icon turns red
   - "Recording..." text appears
   - Microphone icon changes to filled mic
4. Speak clearly in Tagalog or English
5. Click the microphone icon again to stop
6. **Expected**:
   - "Processing..." text appears
   - Spinner shows while processing
   - Transcribed text appears in input field
   - Translation automatically appears in output card

#### Test 2: Permission Handling
1. If prompted, deny microphone permission
2. Click the microphone icon
3. **Expected**: SnackBar shows "Microphone permission is required for speech recognition"

#### Test 3: Empty Recording
1. Click microphone to start recording
2. Don't speak (stay silent)
3. Click microphone to stop
4. **Expected**: SnackBar shows "No speech detected"

#### Test 4: Network Error
1. Disconnect from internet
2. Record some speech
3. **Expected**: SnackBar shows error message with details

#### Test 5: Language Detection
1. **Tagalog to Blaan mode**: Record Tagalog speech
2. **Expected**: Transcribes Tagalog and translates to Blaan
3. Switch to **Blaan to Tagalog mode**: Record English/Blaan speech
4. **Expected**: Transcribes and translates to Tagalog

### Sample Test Phrases

**Tagalog to Blaan mode (speak in Tagalog):**
- "Magandang umaga" (Good morning)
- "Kumusta ka?" (How are you?)
- "Salamat" (Thank you)
- "Paalam" (Goodbye)

**Blaan to Tagalog mode (speak in Tagalog/Blaan):**
- "Kumusta" (Hello)
- "Salamat" (Thank you)
- "Magandang umaga" (Good morning)
- "Paano ka?" (How are you)

**Note:** The app **ONLY accepts Tagalog/Filipino speech** for both translation directions:
- **Tagalog → Blaan**: Expects Filipino/Tagalog speech (`fil`)
- **Blaan → Tagalog**: Expects Filipino/Tagalog speech (`fil`)
- **Non-Tagalog languages** (Korean, Hindi, Chinese, Japanese, Arabic, Thai, Bengali, etc.) will be **REJECTED** with an error message

## Troubleshooting

### Issue: "Please speak in Tagalog only"
**Causes:**
- Speaking in Hindi, Korean, Chinese, Japanese, Arabic, Thai, Bengali, or other non-Tagalog languages
- Mixed language speech
- API incorrectly detected non-Latin characters

**Solutions:**
- **Speak only in Tagalog/Filipino**
- Avoid mixing English/Hindi words (use Tagalog equivalents)
- Speak clearly with proper Tagalog pronunciation
- Retry the recording

### Issue: "No speech detected"
**Causes:**
- Microphone volume too low
- Background noise too high
- Recording too short
- Microphone not selected as input device

**Solutions:**
- Check Windows sound settings
- Increase microphone volume
- Speak louder and clearer
- Record for at least 1-2 seconds

### Issue: "Speech recognition failed"
**Causes:**
- No internet connection
- ElevenLabs API quota exceeded
- Invalid API key
- Audio format not supported

**Solutions:**
- Check internet connection
- Verify API key is valid
- Check ElevenLabs account quota
- Review error message for details

### Issue: Microphone button does nothing
**Causes:**
- Permission denied
- Microphone already in use
- App crashed

**Solutions:**
- Grant microphone permission in Windows settings
- Close other apps using microphone
- Restart the app

## Technical Details

### Audio Configuration
- **Format**: WAV (PCM)
- **Sample Rate**: 16000 Hz (optimized for speech)
- **Bit Rate**: 128000 bps
- **Channels**: Mono (default)

### ElevenLabs API
- **Endpoint**: `https://api.elevenlabs.io/v1/speech-to-text`
- **Model**: `eleven_turbo_v2`
- **Method**: Multipart POST with audio file
- **Authentication**: API key in `xi-api-key` header

### File Handling
- **Temp Directory**: System temp directory via `path_provider`
- **Filename Pattern**: `rec_<timestamp>.wav`
- **Cleanup**: Automatic deletion after processing

## Expected Behavior Summary

| Action | Visual Feedback | Result |
|--------|----------------|--------|
| Click mic (start) | Red mic icon, "Recording..." | Starts recording |
| Click mic (stop) | Spinner, "Processing..." | Stops & transcribes |
| Success | Text in input, auto-translate | Shows translation |
| No speech | SnackBar message | User informed |
| Error | SnackBar with details | User can troubleshoot |
| No permission | SnackBar message | User can grant permission |

## Next Steps

If STT still doesn't work after these fixes:
1. Check the console output for detailed error messages
2. Verify the ElevenLabs API key is valid
3. Test with a simple audio file to isolate the issue
4. Consider adding fallback to Google Speech-to-Text or Whisper API
