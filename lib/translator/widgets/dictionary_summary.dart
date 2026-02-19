import 'package:flutter/material.dart';

class DictionarySummary extends StatelessWidget {
  const DictionarySummary({super.key, required this.entryCount});

  final int entryCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.menu_book_outlined, size: 18),
        const SizedBox(width: 8),
        Text('Dictionary size: $entryCount entries'),
      ],
    );
  }
}
