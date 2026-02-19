import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:blaan_traslator/translator/services/elevenlabs_service.dart';
import 'dart:io';

class VoiceSelectionScreen extends StatefulWidget {
  const VoiceSelectionScreen({
    super.key,
    required this.selectedVoiceId,
    required this.onVoiceChanged,
    this.onBack,
  });

  final String selectedVoiceId;
  final ValueChanged<String> onVoiceChanged;
  final VoidCallback? onBack;

  @override
  State<VoiceSelectionScreen> createState() => _VoiceSelectionScreenState();
}

class _VoiceSelectionScreenState extends State<VoiceSelectionScreen> {
  // Voice Test state
  bool _isPlaying = false;
  AudioPlayer? _player;

  // Avatars mapping (using local asset paths or network images if available, otherwise icons)
  // For this implementation, we'll stick to the icons/colors from the design using existing resources.

  static const List<Map<String, String>> _voices = [
    // Male voices
    {
      'id': 'ErXwobaYiN019PkySvjV',
      'name': 'Kuya Antoni',
      'description': 'Well-rounded and pleasant',
      'gender': 'male',
      'initials': 'KA',
    },
    {
      'id': 'pNInz6obpgDQGcFmaJgB',
      'name': 'Mang Adam',
      'description': 'Deep and resonant',
      'gender': 'male',
      'initials': 'MA',
    },
    {
      'id': 'VR6AewLTigWG4xSOukaG',
      'name': 'Kuya Arnold',
      'description': 'Crisp and clear',
      'gender': 'male',
      'initials': 'KA',
    },
    {
      'id': 'yoZ06aMxZJJ28mfd3POQ',
      'name': 'Tatay Sam',
      'description': 'Dynamic and confident',
      'gender': 'male',
      'initials': 'TS',
    },
    // Female voices
    {
      'id': '21m00Tcm4TlvDq8ikWAM',
      'name': 'Ate Rachel',
      'description': 'Calm narration style',
      'gender': 'female',
      'initials': 'AR',
    },
    {
      'id': 'EXAVITQu4vr4xnSDxMaL',
      'name': 'Inay Bella',
      'description': 'Soft and pleasant',
      'gender': 'female',
      'initials': 'IB',
    },
    {
      'id': 'MF3mGyEYCl7XYWbV9V6O',
      'name': 'Ate Elli',
      'description': 'Emotional and expressive',
      'gender': 'female',
      'initials': 'AE',
    },
  ];

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  Future<void> _playPreview(String voiceId) async {
    const eleven = ElevenLabsService(
      apiKey: 'sk_29fe575ff5247daffef9439e12fffe9326e702b07e9b2ef6',
    );

    setState(() {
      _isPlaying = true;
    });

    try {
      // Different preview text matching the image or persona
      String previewText = "Kamusta! Handa na akong tulungan ka.";

      final File mp3 = await eleven.textToSpeech(
        text: previewText,
        voiceId: voiceId,
      );

      _player = AudioPlayer();
      await _player!.play(DeviceFileSource(mp3.path));

      _player!.onPlayerComplete.listen((_) {
        if (mounted) {
          setState(() {
            _isPlaying = false;
          });
        }
        _player?.dispose();
        _player = null;
        mp3.delete();
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Preview failed: ${e.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      color: scheme.surface,
      child: Column(
        children: [
          // Custom App Bar
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              bottom: 8,
              left: 8,
              right: 8,
            ),
            color: scheme.surface,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: scheme.onSurface),
                  onPressed: widget.onBack ?? () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: Text(
                    'Voices',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: scheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 48), // Balance the back button
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VOICE TEST',
                      style: TextStyle(
                        color: scheme.onSurfaceVariant,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Voice Test Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: scheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: scheme.outlineVariant),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            '"Kamusta! Handa na akong tulungan ka."',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: scheme.onSurfaceVariant,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Visualizer (Simulated with bars)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(7, (index) {
                              // Create a wave effect visually
                              double height = 16.0;
                              if (index == 2 || index == 4) height = 24.0;
                              if (index == 3) height = 32.0;

                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                width: 4,
                                height: height,
                                decoration: BoxDecoration(
                                  color: scheme.primary.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 24),
                          // Play Button
                          GestureDetector(
                            onTap: () {
                              if (!_isPlaying) {
                                _playPreview(widget.selectedVoiceId);
                              } else {
                                _player?.stop();
                                setState(() {
                                  _isPlaying = false;
                                });
                              }
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: scheme
                                    .primary, // Blue in image, used primary
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: scheme.primary.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                _isPlaying ? Icons.stop : Icons.play_arrow,
                                color: scheme.onPrimary,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'SELECT VOICE',
                      style: TextStyle(
                        color: scheme.onSurfaceVariant,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Voices List Container
                    Container(
                      decoration: BoxDecoration(
                        color: scheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: scheme.outlineVariant),
                      ),
                      child: Column(
                        children: List.generate(_voices.length, (index) {
                          final voice = _voices[index];
                          final isSelected =
                              widget.selectedVoiceId == voice['id'];
                          final isLast = index == _voices.length - 1;

                          return Column(
                            children: [
                              InkWell(
                                onTap: () =>
                                    widget.onVoiceChanged(voice['id']!),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      // Avatar Placeholder
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: scheme.surfaceContainerHighest,
                                          shape: BoxShape.circle,
                                          // Use image if we had one, otherwise initials
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          voice['initials']!,
                                          style: TextStyle(
                                            color: scheme.onSurfaceVariant,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              voice['name']!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: scheme.onSurface,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              voice['description']!,
                                              style: TextStyle(
                                                color: scheme.onSurfaceVariant,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (isSelected)
                                        Icon(
                                          Icons.check,
                                          color:
                                              scheme.primary, // Blue in image
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (!isLast)
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: scheme.outlineVariant,
                                  indent: 72, // Align with text
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
