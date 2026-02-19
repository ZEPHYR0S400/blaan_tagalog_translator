import 'package:flutter/material.dart';
import 'package:blaan_traslator/translator/services/translation_service.dart';

class DirectionPicker extends StatelessWidget {
  const DirectionPicker({
    super.key,
    required this.direction,
    required this.onChanged,
  });

  final TranslationDirection direction;
  final ValueChanged<TranslationDirection> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TranslationDirection>(
      segments: const <ButtonSegment<TranslationDirection>>[
        ButtonSegment(
          value: TranslationDirection.tagalogToBlaan,
          label: Text('Tagalog → Blaan'),
          icon: Icon(Icons.translate),
        ),
        ButtonSegment(
          value: TranslationDirection.blaanToTagalog,
          label: Text("Blaan → Tagalog"),
          icon: Icon(Icons.swap_horiz),
        ),
      ],
      selected: <TranslationDirection>{direction},
      onSelectionChanged: (selection) {
        if (selection.isNotEmpty) {
          onChanged(selection.first);
        }
      },
    );
  }
}


