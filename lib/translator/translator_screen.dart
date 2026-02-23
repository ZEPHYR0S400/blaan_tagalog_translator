import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:async';
import 'dart:math' as math;

import 'package:blaan_traslator/translator/services/elevenlabs_service.dart';
import 'package:blaan_traslator/translator/services/translation_service.dart';
import 'package:blaan_traslator/translator/models/translation_result.dart';
import 'package:blaan_traslator/translator/widgets/phrases_bottom_sheet.dart';
import 'package:blaan_traslator/translator/widgets/history_bottom_sheet.dart';
import 'package:blaan_traslator/translator/models/history_entry.dart';
import 'package:blaan_traslator/translator/services/hive_service.dart';
import 'package:blaan_traslator/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:blaan_traslator/translator/dictionary_screen.dart';
import 'package:blaan_traslator/translator/mini_quiz_screen.dart';
import 'package:blaan_traslator/translator/voice_selection_screen.dart'; // Import the new screen

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final TextEditingController _inputController = TextEditingController();
  TranslationDirection _direction = TranslationDirection.tagalogToBlaan;
  String _translatedText = '';
  int _currentTabIndex = 2;

  static const int _maxChars = 500;

  final TranslationService _service = const TranslationService();

  final AudioPlayer _player = AudioPlayer();
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  bool _isProcessingSTT = false;
  late final ElevenLabsService _eleven;
  // Voice options for ElevenLabs TTS
  // Voice params (defaults from previous code)
  String _selectedVoiceId = 'ErXwobaYiN019PkySvjV'; // Kuya Antoni default
  double _stability = 0.50;
  double _similarity = 0.75;
  double _style = 0.0;
  bool _speakerBoost = true;

  // State for sub-screens
  bool _showVoiceSelection = false;

  // Reference to the quiz screen controller
  QuizGameController? _quizController;

  // Track previous tab index
  int _previousTabIndex = 2;

  // Track if quiz game should be shown
  bool _showQuizGame = false;
  int _quizQuestionCount = 10;

  // Silence detection
  Timer? _silenceTimer;
  int _silenceCounter = 0;
  static const int _silenceThresholdMs =
      2000; // Stop after 2 seconds of silence
  static const double _silenceDbThreshold = -45.0; // dB threshold for silence
  @override
  void initState() {
    super.initState();
    _eleven = const ElevenLabsService(
      apiKey: 'sk_29fe575ff5247daffef9439e12fffe9326e702b07e9b2ef6',
    );

    // Configure AudioPlayer to control how it interacts with the system
    // This can help prevent conflicts with hardware buttons (volume keys)
    final AudioContext audioContext = AudioContext(
      iOS: AudioContextIOS(
        category: AVAudioSessionCategory.playAndRecord,
        options: const {
          AVAudioSessionOptions.defaultToSpeaker,
          AVAudioSessionOptions.allowBluetooth,
          AVAudioSessionOptions.allowBluetoothA2DP,
        },
      ),
      android: AudioContextAndroid(
        isSpeakerphoneOn: true,
        stayAwake: true,
        contentType: AndroidContentType.speech,
        usageType: AndroidUsageType.assistant,
        audioFocus: AndroidAudioFocus.gainTransientMayDuck,
      ),
    );
    AudioPlayer.global.setAudioContext(audioContext);
  }

  @override
  void dispose() {
    _silenceTimer?.cancel();
    _inputController.dispose();
    _player.dispose();
    super.dispose();
  }

  Future<void> _performTranslation() async {
    final String rawText = _inputController.text.trim();
    if (rawText.isEmpty) {
      setState(() {
        _translatedText = '';
      });
      return;
    }

    final TranslationResult result = _service.translate(rawText, _direction);

    setState(() {
      _translatedText = result.translatedText;
    });

    // Save to Hive database
    final historyEntry = HistoryEntry(
      sourceText: rawText,
      translatedText: result.translatedText,
      direction: _direction,
      timestamp: DateTime.now(),
    );

    await HiveService.addHistoryEntry(historyEntry);
  }

  Future<void> _stopAndProcessRecording() async {
    _silenceTimer?.cancel();

    // Safety check to ensure we don't process multiple times
    if (!_isRecording || _isProcessingSTT) return;

    setState(() {
      _isProcessingSTT = true;
      _isRecording = false;
    });

    String? path;
    try {
      path = await _recorder.stop();
      if (path == null) {
        setState(() {
          _isProcessingSTT = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save recording')),
          );
        }
        return;
      }

      // Both directions use Filipino/Tagalog language detection
      const String languageCode = 'fil';

      final String text = await _eleven.speechToText(
        audioFile: File(path),
        languageCode: languageCode,
      );

      if (text.isNotEmpty) {
        _inputController.text = text;
        await _performTranslation();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('No speech detected')));
        }
      }
    } catch (e) {
      if (mounted) {
        // Clear any text that might have been set
        _inputController.clear();
        setState(() {
          _translatedText = '';
        });

        String errorMessage = 'Speech recognition failed';
        if (e.toString().contains('Non-Tagalog') ||
            e.toString().contains('non-Tagalog') ||
            e.toString().contains('No Tagalog')) {
          errorMessage = '⚠️ Please speak in Tagalog or Blaan only';
        } else if (e.toString().contains('HttpException')) {
          errorMessage = e.toString().replaceAll('HttpException: ', '');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessingSTT = false;
        });
      }
      // Clean up the temporary audio file
      if (path != null) {
        try {
          await File(path).delete();
        } catch (_) {}
      }
    }
  }

  void _startSilenceDetection() {
    _silenceCounter = 0;
    _silenceTimer?.cancel();
    // Check every 100ms
    _silenceTimer = Timer.periodic(const Duration(milliseconds: 100), (
      timer,
    ) async {
      if (!_isRecording) {
        timer.cancel();
        return;
      }
      try {
        final amplitude = await _recorder.getAmplitude();
        if (amplitude.current < _silenceDbThreshold) {
          _silenceCounter += 100;
        } else {
          _silenceCounter = 0; // Reset counter if sound detected
        }

        if (_silenceCounter >= _silenceThresholdMs) {
          timer.cancel();
          if (mounted && _isRecording) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Silence detected, processing...'),
                duration: Duration(milliseconds: 1000),
                behavior: SnackBarBehavior.floating,
              ),
            );
            await _stopAndProcessRecording();
          }
        }
      } catch (e) {
        // Ignore errors fetching amplitude
      }
    });
  }

  Future<void> _onMicTap() async {
    if (_isProcessingSTT) return;

    if (_isRecording) {
      // Manual stop
      await _stopAndProcessRecording();
      return;
    }

    // Check and request permission
    bool hasPerm = await _recorder.hasPermission();
    if (!hasPerm) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Microphone permission is required for speech recognition',
            ),
            duration: Duration(seconds: 3),
          ),
        );
      }
      return;
    }

    try {
      final Directory dir = await getTemporaryDirectory();
      final String filePath =
          '${dir.path}/rec_${DateTime.now().millisecondsSinceEpoch}.wav';
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          bitRate: 128000,
          sampleRate: 16000,
        ),
        path: filePath,
      );
      setState(() {
        _isRecording = true;
      });

      // Start monitoring for silence
      _startSilenceDetection();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to start recording: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _speak() async {
    if (_translatedText.isEmpty) return;
    try {
      final File mp3 = await _eleven.textToSpeech(
        text: _translatedText,
        voiceId: _selectedVoiceId,
        stability: _stability,
        similarityBoost: _similarity,
        style: _style,
        speakerBoost: _speakerBoost,
      );
      await _player.play(DeviceFileSource(mp3.path));
    } catch (_) {}
  }

  void _openVoiceSelection() {
    setState(() {
      _showVoiceSelection = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Left card shows the source language label
    final String sourceLabel = _direction == TranslationDirection.tagalogToBlaan
        ? 'Tagalog'
        : "Blaan";
    final String targetLabel = _direction == TranslationDirection.tagalogToBlaan
        ? "Blaan"
        : 'Tagalog';

    // Handle tab switching for quiz auto-pause/resume
    if (_previousTabIndex != _currentTabIndex) {
      // If we're leaving the quiz tab (index 4)
      if (_previousTabIndex == 4) {
        // Reset quiz state when leaving the quiz tab
        setState(() {
          _showQuizGame = false;
        });
        if (_quizController != null) {
          _quizController!.pauseGame();
        }
      }
      // If we're entering the quiz tab (index 4)
      else if (_currentTabIndex == 4 && _quizController != null) {
        _quizController!.resumeGame();
      }

      _previousTabIndex = _currentTabIndex;
    }

    if (_showVoiceSelection) {
      return Scaffold(
        body: VoiceSelectionScreen(
          selectedVoiceId: _selectedVoiceId,
          onVoiceChanged: (id) {
            setState(() {
              _selectedVoiceId = id;
            });
          },
          onBack: () {
            setState(() {
              _showVoiceSelection = false;
            });
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: _currentTabIndex,
        children: [
          // Page 0 - History
          _HistoryPage(
            key: ValueKey(
              _currentTabIndex == 0 ? DateTime.now().millisecondsSinceEpoch : 0,
            ),
          ),
          // Page 1 - Phrases
          PhrasesBottomSheet(voiceId: _selectedVoiceId),
          // Page 2 - Translate (CENTER)
          _TranslatePage(
            sourceLabel: sourceLabel,
            targetLabel: targetLabel,
            inputController: _inputController,
            maxChars: _maxChars,
            translatedText: _translatedText,
            isRecording: _isRecording,
            isProcessingSTT: _isProcessingSTT,
            onMicTap: _onMicTap,
            onSubmitted: (_) async => await _performTranslation(),
            onSpeak: _translatedText.isEmpty ? null : _speak,
            direction: _direction,
            onSwap: () {
              setState(() {
                _direction = _direction == TranslationDirection.tagalogToBlaan
                    ? TranslationDirection.blaanToTagalog
                    : TranslationDirection.tagalogToBlaan;
              });
            },
          ),
          // Page 3 - Dictionary
          const DictionaryScreen(),
          // Page 4 - Quiz
          _showQuizGame
              ? QuizMiniGame(
                  questionCount: _quizQuestionCount,
                  onControllerReady: (controller) {
                    setState(() {
                      _quizController = controller;
                    });
                  },
                  onQuit: () {
                    setState(() {
                      _showQuizGame = false;
                    });
                  },
                )
              : _QuizStartScreen(
                  onStartGame: (count) {
                    setState(() {
                      _showQuizGame = true;
                      _quizQuestionCount = count;
                    });
                  },
                ),
          // Page 5 - Settings
          _SettingsBottomSheet(
            onOpenVoices: _openVoiceSelection, // Pass the new navigation method
          ),
        ],
      ),
      bottomNavigationBar: _CustomBottomNavigationBar(
        selectedIndex: _currentTabIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      ),
    );
  }
}

// Translate Page Widget
class _TranslatePage extends StatelessWidget {
  const _TranslatePage({
    required this.sourceLabel,
    required this.targetLabel,
    required this.inputController,
    required this.maxChars,
    required this.translatedText,
    required this.isRecording,
    required this.isProcessingSTT,
    required this.onMicTap,
    required this.onSubmitted,
    required this.onSpeak,
    required this.direction,
    required this.onSwap,
  });

  final String sourceLabel;
  final String targetLabel;
  final TextEditingController inputController;
  final int maxChars;
  final String translatedText;
  final bool isRecording;
  final bool isProcessingSTT;
  final VoidCallback onMicTap;
  final ValueChanged<String> onSubmitted;
  final VoidCallback? onSpeak;
  final TranslationDirection direction;
  final VoidCallback onSwap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final titleColor = isDark ? scheme.onSurface : const Color(0xFF0F3D2E);
    final dividerColor = scheme.outlineVariant.withOpacity(isDark ? 0.25 : 0.2);

    final bottomPadding =
        14.0 + MediaQuery.viewPaddingOf(context).bottom + 72.0;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(14, 16, 14, bottomPadding),
        child: Column(
          children: [
            // Title Header
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0), // Reduced from 24
              child: Column(
                children: [
                  Text(
                    'Blaan–Tagalog Dialect Translator',
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12), // Reduced from 16
                  Divider(height: 1, thickness: 1, color: dividerColor),
                ],
              ),
            ),
            // Center the language selector
            Center(
              child: _LanguageSelector(
                leftLabel: sourceLabel,
                rightLabel: targetLabel,
                onSwap: onSwap,
              ),
            ),
            const SizedBox(height: 18), // Reduced from 24
            _InputCard(
              title: sourceLabel.toUpperCase(),
              controller: inputController,
              hintText: "Type to translate...",
              maxChars: maxChars,
              onSubmitted: onSubmitted,
              onMicTap: onMicTap,
              isRecording: isRecording,
              isProcessingSTT: isProcessingSTT,
            ),
            const SizedBox(height: 12), // Reduced from 16
            SizedBox(
              width: double.infinity,
              height: 44, // Reduced from 56
              child: ElevatedButton(
                onPressed: () => onSubmitted(inputController.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: scheme.primary,
                  foregroundColor: scheme.onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15, // Reduced from 18
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Translate'),
              ),
            ),
            const SizedBox(height: 12), // Reduced from 16
            _OutputCard(
              title: targetLabel.toUpperCase(),
              text: translatedText,
              onSpeak: onSpeak,
              isPlaceholder: translatedText.isEmpty,
            ),
          ],
        ),
      ),
    );
  }
}

// History Page Widget
class _HistoryPage extends StatefulWidget {
  const _HistoryPage({super.key});

  @override
  State<_HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<_HistoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // Refresh history every time this builds
    final entries = HiveService.getSortedHistoryEntries();
    return HistoryBottomSheet(entries: entries);
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({
    required this.leftLabel,
    required this.rightLabel,
    required this.onSwap,
  });

  final String leftLabel;
  final String rightLabel;
  final VoidCallback onSwap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Preserve the current light-mode look, but switch to scheme-based colors in dark mode.
    final Color backgroundColor = isDark
        ? scheme.surfaceContainerHighest
        : const Color(0xFFF0FDF4);
    final Color textColor = isDark ? scheme.onSurface : const Color(0xFF0F3D2E);

    final maxWidth =
        MediaQuery.sizeOf(context).width - 28; // page horizontal padding
    final containerWidth = math.min(260.0, math.max(180.0, maxWidth));

    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ), // Reduced padding
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: isDark
            ? Border.all(color: scheme.outlineVariant.withOpacity(0.35))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            leftLabel,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13, // Reduced from 16
            ),
          ),
          const SizedBox(width: 12), // Reduced from 16
          IconButton(
            onPressed: onSwap,
            icon: Icon(
              Icons.swap_horiz,
              color: textColor.withOpacity(0.6),
              size: 20, // Reduced from 24
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          const SizedBox(width: 12), // Reduced from 16
          Text(
            rightLabel,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13, // Reduced from 16
            ),
          ),
        ],
      ),
    );
  }
}

class _InputCard extends StatelessWidget {
  const _InputCard({
    required this.title,
    required this.controller,
    required this.hintText,
    required this.maxChars,
    required this.onSubmitted,
    required this.onMicTap,
    this.isRecording = false,
    this.isProcessingSTT = false,
  });

  final String title;
  final TextEditingController controller;
  final String hintText;
  final int maxChars;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onMicTap;
  final bool isRecording;
  final bool isProcessingSTT;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final surface = isDark ? scheme.surface : Colors.white;
    final borderColor = isDark
        ? scheme.outlineVariant.withOpacity(0.4)
        : Colors.grey.withOpacity(0.2);
    final labelColor = isDark
        ? scheme.onSurfaceVariant
        : const Color(0xFF6B7280);
    final inputTextColor = isDark ? scheme.onSurface : const Color(0xFF0F3D2E);
    final hintColor = isDark
        ? scheme.onSurfaceVariant.withOpacity(0.8)
        : const Color(0xFF0F3D2E).withOpacity(0.6);
    final micBg = isDark
        ? scheme.surfaceContainerHighest
        : const Color(0xFFF0FDF4);
    final micBorder = isDark
        ? scheme.outlineVariant.withOpacity(0.35)
        : const Color(0xFF0F3D2E).withOpacity(0.1);

    return Container(
      height: 200, // Reduced from 250
      padding: const EdgeInsets.all(16), // Reduced from 20
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: isDark
            ? const []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: labelColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10, // Reduced from 12
                  letterSpacing: 1.0,
                ),
              ),
              GestureDetector(
                onTap: () => controller.clear(),
                child: Icon(
                  Icons.close,
                  size: 18, // Reduced from 20
                  color: labelColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // Reduced from 16
          Expanded(
            child: TextField(
              controller: controller,
              minLines: null,
              maxLines: null,
              expands: true,
              maxLength: maxChars,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: hintColor,
                  fontSize: 18, // Reduced from 22
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
                filled: false,
              ),
              style: TextStyle(
                fontSize: 18, // Reduced from 22
                color: inputTextColor,
                fontWeight: FontWeight.w500,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: onSubmitted,
            ),
          ),
          const SizedBox(height: 10), // Reduced from 12
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: isProcessingSTT ? null : onMicTap,
              child: Container(
                padding: const EdgeInsets.all(10), // Reduced from 12
                decoration: BoxDecoration(
                  color: micBg,
                  shape: BoxShape.circle,
                  border: Border.all(color: micBorder),
                ),
                child: isProcessingSTT
                    ? SizedBox(
                        width: 20, // Reduced from 24
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            scheme.primary,
                          ),
                        ),
                      )
                    : Icon(
                        isRecording ? Icons.stop : Icons.mic_none,
                        color: isRecording
                            ? scheme.error
                            : (isDark
                                  ? scheme.onSurface
                                  : const Color(0xFF0F3D2E)),
                        size: 20, // Reduced from 24
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OutputCard extends StatefulWidget {
  const _OutputCard({
    required this.title,
    required this.text,
    this.onSpeak,
    this.isPlaceholder = false,
  });

  final String title;
  final String text;
  final VoidCallback? onSpeak;
  final bool isPlaceholder;

  @override
  State<_OutputCard> createState() => _OutputCardState();
}

class _OutputCardState extends State<_OutputCard> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Preserve the current light-mode look, but switch to scheme-based colors in dark mode.
    final Color backgroundColor = isDark
        ? scheme.surfaceContainerHighest
        : const Color(0xFFF0FDF4);
    final Color textColor = isDark ? scheme.onSurface : const Color(0xFF0F3D2E);
    final Color labelColor = isDark
        ? scheme.onSurfaceVariant
        : const Color(0xFF0F3D2E);
    final borderColor = isDark
        ? scheme.outlineVariant.withOpacity(0.45)
        : textColor.withOpacity(0.1);

    return Container(
      constraints: const BoxConstraints(minHeight: 200), // Reduced from 250
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(16), // Reduced from 20
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: labelColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10, // Reduced from 12
                  letterSpacing: 1.0,
                ),
              ),
              // Optional: You could add a copy/speak icon row here if you moved them up,
              // but the image shows them at bottom.
            ],
          ),
          const SizedBox(height: 12), // Reduced from 16
          Text(
            widget.isPlaceholder ? "Translation will appear here" : widget.text,
            style: TextStyle(
              color: widget.isPlaceholder
                  ? textColor.withOpacity(0.5)
                  : textColor,
              fontSize: 18.0, // Reduced from 22.0
              height: 1.3,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18), // Reduced from 24
          // Spacer(), // Push to bottom if needed, but minHeight might handle it
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!widget.isPlaceholder)
                IconButton(
                  onPressed: widget.onSpeak,
                  icon: Icon(
                    Icons.volume_up_outlined,
                    color: textColor,
                    size: 20, // Reduced from 24
                  ),
                  tooltip: 'Speak',
                ),
              const SizedBox(width: 8),
              if (!widget.isPlaceholder)
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: widget.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Copied to clipboard'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.copy_outlined,
                    color: textColor,
                    size: 18,
                  ), // Reduced size
                  tooltip: 'Copy',
                ),
              // If placeholder, show disabled/faint icons or nothing?
              // Image shows generic icons at bottom right. The image seems to have them visible but maybe disabled state?
              // I'll show them as visible but maybe disabled or just nothing if placeholder.
              // Image "Tagalog" card "Translation will appear here" has icons at bottom right: Speaker and Copy.
              // So they should be visible even if placeholder, maybe?
              // Actually, usually you can't speak/copy empty text. I'll stick to logic: only show if not placeholder, OR show greyed out.
              // The image shows them clearly. I will keep them visible but inactive?
              // Let's stick to current logic (hide if placeholder) for functionality, or show them (greyed) to match visual.
              // The screenshot specifically shows the placeholder state AND the icons. So I should show them.
              if (widget.isPlaceholder) ...[
                Icon(
                  Icons.volume_up_outlined,
                  color: textColor.withOpacity(0.3),
                  size: 20, // Reduced from 24
                ),
                const SizedBox(width: 14),
                Icon(
                  Icons.content_copy,
                  color: textColor.withOpacity(0.3),
                  size: 18, // Reduced from 20
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// Designed-by badge removed as requested

class _SettingsBottomSheet extends StatelessWidget {
  const _SettingsBottomSheet({this.onOpenVoices});

  final VoidCallback? onOpenVoices;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final scheme = Theme.of(context).colorScheme;
    final isDarkMode = themeProvider.isDarkMode;

    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final iconBgColor = scheme.primary.withOpacity(0.1);
    final titleColor = scheme.onSurface;

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: scheme.onSurfaceVariant.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader(context, 'PREFERENCES'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: scheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                        boxShadow: [
                          BoxShadow(
                            color: scheme.shadow.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          children: [
                            _SettingsTile(
                              icon: isDarkMode
                                  ? Icons.dark_mode
                                  : Icons.dark_mode_outlined,
                              title: 'Dark Mode',
                              iconBgColor: iconBgColor,
                              iconColor: scheme.primary,
                              trailing: Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  value: isDarkMode,
                                  onChanged: (value) =>
                                      themeProvider.toggleTheme(),
                                  activeColor: scheme.primary,
                                ),
                              ),
                            ),
                            _buildDivider(),
                            _SettingsTile(
                              icon: Icons.volume_up_outlined,
                              title: 'Voices',
                              iconBgColor: iconBgColor,
                              iconColor: scheme.primary,
                              onTap:
                                  onOpenVoices, // This callback will now open the full page
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionHeader(context, 'SUPPORT'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: scheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(
                            255,
                            136,
                            136,
                            136,
                          ).withOpacity(0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: scheme.shadow.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          children: [
                            _SettingsTile(
                              icon: Icons.info_outline,
                              title: 'About',
                              iconBgColor: iconBgColor,
                              iconColor: scheme.primary,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.surface,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (_) => const _AboutBottomSheet(),
                                );
                              },
                            ),
                            _buildDivider(),
                            _SettingsTile(
                              icon: Icons.help_outline,
                              title: 'Help',
                              iconBgColor: iconBgColor,
                              iconColor: scheme.primary,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.surface,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (_) => const _HelpBottomSheet(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.withOpacity(0.05),
      indent: 0,
      endIndent: 0,
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.iconBgColor,
    required this.iconColor,
    this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Color iconBgColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (trailing != null)
                trailing!
              else
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HelpBottomSheet extends StatelessWidget {
  const _HelpBottomSheet();

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.help_outline, color: scheme.primary, size: 28),
              const SizedBox(width: 16),
              Text(
                'How to Use',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _HelpRow(
            icon: Icons.mic_none,
            title: 'Voice Input',
            subtitle: 'Click the microphone button and speak to input text.',
            color: scheme.primary,
          ),
          const SizedBox(height: 16),
          _HelpRow(
            icon: Icons.volume_up_outlined,
            title: 'Voice Output',
            subtitle: 'Click the speaker button to hear the translation.',
            color: scheme.primary,
          ),
          const SizedBox(height: 16),
          _HelpRow(
            icon: Icons.translate_outlined,
            title: 'Translate',
            subtitle: 'Click the translate button to convert your text.',
            color: scheme.primary,
          ),
          const SizedBox(height: 16),
          _HelpRow(
            icon: Icons.copy_outlined,
            title: 'Copy',
            subtitle: 'Click the copy button to copy the translation.',
            color: scheme.primary,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _HelpRow extends StatelessWidget {
  const _HelpRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class _AboutBottomSheet extends StatelessWidget {
  const _AboutBottomSheet();

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: scheme.primary, size: 28),
              const SizedBox(width: 16),
              Text(
                'About',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'About B\'laan Language',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            'B\'laan (also spelled Blaan or Bilaan) is an indigenous language spoken by the B\'laan people in the southern Philippines, particularly in South Cotabato, Davao del Sur, and Sarangani provinces.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'The B\'laan language belongs to the Malayo-Polynesian branch of the Austronesian language family and has several dialects.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This translator helps bridge communication between B\'laan speakers and those who speak English or Filipino.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.history, // Changed from access_time
                label: 'History',
                isSelected: selectedIndex == 0,
                onTap: () => onDestinationSelected(0),
              ),
              _NavItem(
                icon: Icons.format_quote_outlined, // Outlined for consistency
                label: 'Phrases',
                isSelected: selectedIndex == 1,
                onTap: () => onDestinationSelected(1),
              ),
              _NavItem(
                icon: Icons.translate,
                label: 'Translate',
                isSelected: selectedIndex == 2,
                onTap: () => onDestinationSelected(2),
              ),
              _NavItem(
                icon: Icons.menu_book_outlined, // More book-like
                label: 'Dictionary',
                isSelected: selectedIndex == 3,
                onTap: () => onDestinationSelected(3),
              ),
              _NavItem(
                icon: Icons.sports_esports_outlined, // More modern game icon
                label: 'Quiz',
                isSelected: selectedIndex == 4,
                onTap: () => onDestinationSelected(4),
              ),
              _NavItem(
                icon: Icons.settings_outlined, // Outlined
                label: 'Settings',
                isSelected: selectedIndex == 5,
                onTap: () => onDestinationSelected(5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Quiz Start Screen Widget
class _QuizStartScreen extends StatefulWidget {
  const _QuizStartScreen({required this.onStartGame});

  final void Function(int questionCount) onStartGame;

  @override
  State<_QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<_QuizStartScreen> {
  int _questionCount = 15;

  Widget _buildOption(int count, String label) {
    final bool isSelected = _questionCount == count;
    final scheme = Theme.of(context).colorScheme;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _questionCount = count;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? scheme.primary : scheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? scheme.primary : scheme.primary,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                '$count',
                style: TextStyle(
                  color: isSelected ? scheme.onPrimary : scheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? scheme.onPrimary
                      : scheme.onSurfaceVariant,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // Using a light green background similar to the image, derived from primary if possible
    // or hardcoded if necessary to match the "light mint" look without changing theme.
    // The image has a very distinct light green card.
    final Color cardBackground = scheme.surfaceContainerHighest;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        title: Text(
          'Quiz Game',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: scheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            decoration: BoxDecoration(
              color: cardBackground,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: scheme.outline),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: scheme.primary, // Green circle
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.gamepad, // Or Icons.sports_esports
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Vocabulary Quiz',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Test your knowledge of Blaan\nwords. How many questions would\nyou like to answer?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: scheme.onSurfaceVariant,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'NUMBER OF QUESTIONS',
                  style: TextStyle(
                    color: scheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildOption(10, 'Quick'),
                    const SizedBox(width: 12),
                    _buildOption(15, 'Normal'),
                    const SizedBox(width: 12),
                    _buildOption(20, 'Long'),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => widget.onStartGame(_questionCount),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: scheme.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Start Game',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurfaceVariant;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
