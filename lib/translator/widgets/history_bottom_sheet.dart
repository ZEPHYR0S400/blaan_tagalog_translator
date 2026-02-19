import 'package:flutter/material.dart';
import 'package:blaan_traslator/translator/models/history_entry.dart';
import 'package:blaan_traslator/translator/services/translation_service.dart';
import 'package:blaan_traslator/translator/services/hive_service.dart';

class HistoryBottomSheet extends StatefulWidget {
  const HistoryBottomSheet({super.key, required this.entries});

  final List<HistoryEntry> entries;

  @override
  State<HistoryBottomSheet> createState() => _HistoryBottomSheetState();
}

class _HistoryBottomSheetState extends State<HistoryBottomSheet> {
  late List<HistoryEntry> _entries;

  @override
  void initState() {
    super.initState();
    _entries = List.from(widget.entries);
  }

  String _dirLabel(TranslationDirection dir) =>
      dir == TranslationDirection.tagalogToBlaan
      ? "Tagalog → Blaan"
      : "Blaan → Tagalog";

  Future<void> _handleDelete(int index) async {
    await HiveService.deleteHistoryEntry(index);
    setState(() {
      _entries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'History',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          if (_entries.isNotEmpty)
            IconButton(
              onPressed: () async {
                final bool? confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    final scheme = Theme.of(context).colorScheme;
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                      backgroundColor: scheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Warning Icon
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: scheme.errorContainer,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.warning_amber_rounded,
                                color: scheme.error,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Title
                            Text(
                              'Delete History?',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: scheme.onSurface,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            // Subtitle
                            Text(
                              'Are you sure you want to delete your entire translation history? This action cannot be undone.',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: scheme.onSurfaceVariant),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            // Buttons
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          scheme.secondaryContainer,
                                      foregroundColor:
                                          scheme.onSecondaryContainer,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    style: TextButton.styleFrom(
                                      backgroundColor: scheme.error,
                                      foregroundColor: scheme.onError,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );

                if (confirm == true) {
                  await HiveService.clearHistory();
                  setState(() {
                    _entries.clear();
                  });
                }
              },
              icon: Icon(
                Icons.delete_outline,
                color: const Color(0xFFDA2428),
              ),
              tooltip: 'Clear All History',
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: _entries.isEmpty
          ? _EmptyState()
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: _entries.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final HistoryEntry e = _entries[index];
                return Dismissible(
                  key: Key('${e.timestamp.millisecondsSinceEpoch}'),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    _handleDelete(index);
                  },
                  background: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDA2428),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  secondaryBackground: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDA2428),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  child: _HistoryTile(
                    title: _dirLabel(e.direction),
                    source: e.sourceText,
                    result: e.translatedText,
                    time: e.timestamp,
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.history,
                size: 32,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No translation history',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Start translating to see your history here',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({
    required this.title,
    required this.source,
    required this.result,
    required this.time,
  });

  final String title;
  final String source;
  final String result;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.outlineVariant),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Source Text (Top)
          Text(
            source,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: scheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          // Translated Text (Green)
          Text(
            result,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          // Divider
          Divider(color: scheme.outlineVariant, thickness: 1, height: 1),
          const SizedBox(height: 12),
          // Footer: Time and Chip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDate(time),
                style: TextStyle(
                  color: scheme.onSurfaceVariant,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: scheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: scheme.primary.withValues(alpha: 0.8),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(date.year, date.month, date.day);

    final timeStr = _formatTime(date);

    if (dateToCheck == today) {
      return 'Today, $timeStr';
    } else if (dateToCheck == yesterday) {
      return 'Yesterday, $timeStr';
    } else {
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      final month = months[date.month - 1];
      return '$month ${date.day}, $timeStr';
    }
  }

  String _formatTime(DateTime t) {
    final int hour = t.hour;
    final int minute = t.minute;
    final String period = hour >= 12 ? 'PM' : 'AM';
    final int displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    final String h = displayHour.toString();
    final String m = minute.toString().padLeft(2, '0');
    return '$h:$m $period';
  }
}
