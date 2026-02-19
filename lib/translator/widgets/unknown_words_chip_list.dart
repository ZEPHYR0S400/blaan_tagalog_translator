import 'package:flutter/material.dart';

class UnknownWordsChipList extends StatelessWidget {
  const UnknownWordsChipList({
    super.key,
    required this.unknownWords,
  });

  final List<String> unknownWords;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Words with no match in the dictionary:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: unknownWords
              .map((w) => Chip(label: Text(w)))
              .toList(growable: false),
        ),
      ],
    );
  }
}


