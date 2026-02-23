import 'package:flutter/material.dart';
import 'package:blaan_traslator/translator/data/phrases.dart';
import 'package:blaan_traslator/translator/models/phrase.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:blaan_traslator/translator/services/elevenlabs_service.dart';

class PhrasesBottomSheet extends StatefulWidget {
  const PhrasesBottomSheet({super.key, required this.voiceId});

  final String voiceId;

  @override
  State<PhrasesBottomSheet> createState() => _PhrasesBottomSheetState();
}

class _PhrasesBottomSheetState extends State<PhrasesBottomSheet> {
  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();
  final AudioPlayer _player = AudioPlayer();
  late final ElevenLabsService _eleven;

  @override
  void initState() {
    super.initState();
    _eleven = const ElevenLabsService(
      apiKey: 'sk_29fe575ff5247daffef9439e12fffe9326e702b07e9b2ef6',
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _player.dispose();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (text.isEmpty) return;
    try {
      final File mp3 = await _eleven.textToSpeech(
        text: text,
        voiceId: widget.voiceId,
        stability: 0.5,
        similarityBoost: 0.5,
        style: 0.0,
        speakerBoost: true,
      );
      await _player.play(DeviceFileSource(mp3.path));
    } catch (e) {
      debugPrint('TTS Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final String query = _searchController.text.trim().toLowerCase();

    // Filter phrases based on search query first
    final List<Phrase> searchFiltered = phrases.where((Phrase p) {
      return query.isEmpty ||
          p.word.toLowerCase().contains(query) ||
          p.translation.toLowerCase().contains(query) ||
          p.pronunciation.toLowerCase().contains(query);
    }).toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            "Common Blaan Phrases",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search phrases...',
                hintStyle: TextStyle(
                  color: scheme.onSurfaceVariant.withOpacity(0.7),
                  fontSize: 13,
                ),
                prefixIcon: Icon(Icons.search, color: scheme.primary),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: scheme.outlineVariant.withOpacity(0.7),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: scheme.outlineVariant.withOpacity(0.6),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: scheme.primary, width: 1.4),
                ),
                filled: true,
                fillColor: isDark
                    ? scheme.surfaceContainerHighest
                    : scheme.surfaceContainerHighest.withOpacity(0.3),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final chips = [
                  for (final String cat in phraseCategories)
                    Padding(
                      padding: const EdgeInsets.only(right: 7.0, bottom: 8.0),
                      child: _CategoryChip(
                        label: cat,
                        isSelected: _selectedCategory == cat,
                        onTap: () => setState(() => _selectedCategory = cat),
                      ),
                    ),
                ];

                // Wider screens: wrap chips (no horizontal scrolling).
                if (constraints.maxWidth >= 520) {
                  return Wrap(children: chips);
                }

                // Smaller screens: keep horizontal scroll.
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final w in chips)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: w,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: _buildList(context, searchFiltered)),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, List<Phrase> filteredPhrases) {
    // If specific category selected, just show those
    if (_selectedCategory != 'All') {
      final categoryPhrases = filteredPhrases
          .where((p) => p.category == _selectedCategory)
          .toList();
      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
        physics: const BouncingScrollPhysics(),
        itemCount: categoryPhrases.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return _PhraseItem(
            phrase: categoryPhrases[index],
            onSpeak: () => _speak(categoryPhrases[index].word),
          );
        },
      );
    }

    // If 'All' is selected, group by category
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
      itemCount: phraseCategories
          .length, // Skip 'All' is handled inside loop effectively or we iterate categories
      itemBuilder: (context, index) {
        final category = phraseCategories[index];
        if (category == 'All') return const SizedBox.shrink();

        final categoryPhrases = filteredPhrases
            .where((p) => p.category == category)
            .toList();

        if (categoryPhrases.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SectionHeader(title: category.toUpperCase()),
            const SizedBox(height: 4),
            ...categoryPhrases.map(
              (p) => _PhraseItem(phrase: p, onSpeak: () => _speak(p.word)),
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected
              ? scheme.primary.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : scheme.outline.withOpacity(0.5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? scheme.primary : scheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 7),
      color: isDark
          ? scheme.surfaceContainerHighest
          : scheme.surfaceContainerHighest.withOpacity(0.5),
      child: Text(
        title,
        style: TextStyle(
          color: scheme.onSurfaceVariant,
          fontWeight: FontWeight.bold,
          fontSize: 11,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _PhraseItem extends StatelessWidget {
  const _PhraseItem({required this.phrase, required this.onSpeak});

  final Phrase phrase;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onSpeak,
          child: Container(
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: scheme.outline.withOpacity(0.45),
              ),
              boxShadow: [
                BoxShadow(
                  color: scheme.shadow.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phrase.word,
                        style: TextStyle(
                          color: scheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        phrase.pronunciation,
                        style: TextStyle(
                          color: scheme.onSurfaceVariant,
                          fontSize: 12.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        phrase.translation,
                        style: TextStyle(
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                _SpeakerButton(onTap: onSpeak),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SpeakerButton extends StatelessWidget {
  const _SpeakerButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: isDark
          ? scheme.surfaceContainerHighest.withOpacity(0.7)
          : scheme.secondary.withOpacity(0.1),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Icon(
            Icons.volume_up_outlined,
            color: scheme.primary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
