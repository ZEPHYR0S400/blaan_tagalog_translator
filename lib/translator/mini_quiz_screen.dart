import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

// Public interface for controlling the quiz game
abstract class QuizGameController {
  void pauseGame();
  void resumeGame();
}

class QuizMiniGame extends StatefulWidget {
  const QuizMiniGame({
    super.key,
    this.onControllerReady,
    this.onQuit,
    required this.questionCount,
  });

  final void Function(QuizGameController controller)? onControllerReady;
  final VoidCallback? onQuit;
  final int questionCount;

  @override
  State<QuizMiniGame> createState() => _QuizMiniGameState();
}

class _QuizMiniGameState extends State<QuizMiniGame>
    with WidgetsBindingObserver
    implements QuizGameController {
  final List<_Question> _allQuestions = [
    _Question(
      prompt: 'fye flafus',
      options: [
        'Magandang Gabi',
        'Magandang Umaga',
        'Magandang Hapon',
        'Maganda',
      ],
      correctIndex: 1,
    ),
    _Question(
      prompt: 'Lando Filak',
      options: [
        'Walang Filak',
        'Walang Pagkain',
        'Walang Silbi',
        'Walang pera',
      ],
      correctIndex: 3,
    ),
    _Question(
      prompt: 'Alfo',
      options: ['Daloy', 'Anino', 'Niyog', 'Kutsara'],
      correctIndex: 2,
    ),
    _Question(
      prompt: 'Fye Alturo',
      options: [
        'Kumusta Ka',
        'Magandang Tanghali',
        'Kumain Kana',
        'Walang Pera',
      ],
      correctIndex: 1,
    ),
    _Question(
      prompt: 'Balfabi',
      options: ['Ngayon', 'Kalat', 'Kahapon', 'Mabilis'],
      correctIndex: 2,
    ),
    _Question(
      prompt: 'Katapusan',
      options: ['Di Dungan', 'Digusen', 'Dile', 'Diye'],
      correctIndex: 1,
    ),
    _Question(
      prompt: 'Kaarawan',
      options: ['Dungan', 'Du', 'Duen', 'Do Aksut'],
      correctIndex: 3,
    ),
    _Question(
      prompt: 'Agad-agad',
      options: ['Ee', 'Fabatik', 'Fagbet', 'Fabatikam'],
      correctIndex: 3,
    ),
    _Question(
      prompt: 'Pakinig',
      options: ['Falibot', 'Femlinge', 'Fmusok', 'Fon'],
      correctIndex: 1,
    ),
    _Question(
      prompt: 'Kita',
      options: ['Gito', 'Gite', 'Glifet', 'Kafye Balu'],
      correctIndex: 1,
    ),
    // New questions based on dictionary entries
    _Question(
      prompt: 'Paibabaw',
      options: ['Afdata', 'Aftud', 'Aswila', 'Banwe'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Paiyakin',
      options: ['Afkarew', 'Afgule', 'Baya', 'Dalmeh'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Pailalim',
      options: ['Afngalam', 'Alfo', 'Bleng', 'Bli'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Pahinga',
      options: ['Aftud', 'Ambal', 'Ani', 'Balfabi'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Pahatid',
      options: ['Aftunda', 'Aswila', 'Bu', 'Dagit'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Daloy',
      options: ['Alo', 'Alfo', 'Ani', 'Bleng'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Paalam',
      options: ['Ambal', 'Afmite', 'Baya', 'Diye'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Paaralan',
      options: ['Aswila', 'Amse', 'Banwe', 'Bu'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Mundo',
      options: ['Banwe', 'Bawe', 'Alfo', 'Ani'],
      correctIndex: 0,
    ),
    _Question(
      prompt: 'Mukha',
      options: ['Bawe', 'Bli', 'Bu', 'Dalmeh'],
      correctIndex: 0,
    ),
  ];

  late List<_Question> _questions;
  late final int _roundLength;
  int _currentIndex = 0;
  int _score = 0;
  int _timeLeft = 10;
  Timer? _timer;
  bool _paused = false;
  int? _selectedIndex;
  bool _showFeedback = false;
  bool _wasPausedByUser = false; // Track if paused by user or system
  DateTime? _roundStartTime;

  @override
  void initState() {
    super.initState();
    _roundLength = min(widget.questionCount, _allQuestions.length);
    _setupRound();
    WidgetsBinding.instance.addObserver(this);

    // Notify parent widget about controller being ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onControllerReady?.call(this);
    });
  }

  // Public method to pause the game from outside
  @override
  void pauseGame() {
    if (!mounted) return;
    if (!_paused) {
      setState(() {
        _paused = true;
        _wasPausedByUser = true; // Mark as paused by system
        // Keep the timer running but stop UI updates
      });
    }
  }

  // Public method to resume the game from outside
  @override
  void resumeGame() {
    if (!mounted) return;
    if (_paused && _wasPausedByUser) {
      setState(() {
        _paused = false;
        _wasPausedByUser = false; // Reset user pause flag
        // Timer should still be running, UI updates will resume
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // App is in background, pause the game UI updates but keep timer running
      if (!_paused) {
        _wasPausedByUser = false; // System paused
        pauseGame();
      }
    } else if (state == AppLifecycleState.resumed) {
      // App is back in foreground, resume UI updates
      if (_paused && !_wasPausedByUser) {
        resumeGame();
      }
    }
  }

  void _setupRound() {
    final rng = Random();
    _questions = List<_Question>.from(_allQuestions);

    // Randomize the order of questions
    _questions.shuffle(rng);

    // Randomize options for each question
    for (int i = 0; i < _questions.length; i++) {
      _questions[i] = _questions[i].randomized(rng);
    }

    if (_questions.length > _roundLength) {
      _questions = _questions.take(_roundLength).toList();
    }
    _currentIndex = 0;
    _score = 0;
    _roundStartTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timeLeft = 10;
    if (!_wasPausedByUser) {
      _paused = false; // Only unpause if not paused by user
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_paused) return; // Don't update UI when paused
      if (!mounted) return;
      setState(() {
        _timeLeft -= 1;
        if (_timeLeft <= 0) {
          _handleTimeout();
        }
      });
    });
  }

  void _handleTimeout() {
    _timer?.cancel();
    _selectedIndex = null;
    _advanceQuestion();
  }

  void _togglePause() {
    if (!mounted) return;

    // If we're pausing, pause the game first then show the pause dialog
    if (!_paused) {
      setState(() {
        _paused = true;
        _wasPausedByUser = true; // Mark as user paused
      });
      _showPauseDialog();
    } else {
      // If we're resuming, just resume the game
      setState(() {
        _paused = false;
        _wasPausedByUser = false; // Mark as unpaused
      });
    }
  }

  void _showPauseDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final scheme = Theme.of(context).colorScheme;
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: scheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Game Paused',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Your Blaan to Tagalog quiz is paused.\nWhat would you like to do?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: scheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // Resume Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Continue game - resume the game
                      setState(() {
                        _paused = false;
                        _wasPausedByUser = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: scheme.primary,
                      foregroundColor: scheme.onPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Resume',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Restart Button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Restart game
                      setState(() {
                        _setupRound();
                        _paused = false;
                        _wasPausedByUser = false;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: isDark
                          ? scheme.surfaceContainerHighest
                          : const Color(0xFFDCFCE7),
                      foregroundColor: isDark
                          ? scheme.onSurface
                          : const Color(0xFF166534),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Quit Button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Quit game
                      widget.onQuit?.call();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFDA2428),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Quit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onSelect(int index) {
    if (_showFeedback) return;
    if (!mounted) return;
    setState(() {
      _selectedIndex = index;
      _showFeedback = true;
      final correct = index == _questions[_currentIndex].correctIndex;
      if (correct) _score += 10; // simple scoring
    });

    // brief feedback then move on
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;
      setState(() {
        _showFeedback = false;
        _selectedIndex = null;
      });
      _advanceQuestion();
    });
  }

  void _advanceQuestion() {
    if (_currentIndex < _questions.length - 1) {
      if (!mounted) return;
      setState(() {
        _currentIndex += 1;
      });
      _startTimer();
    } else {
      _timer?.cancel();
      _showGameOver();
    }
  }

  void _showGameOver() {
    // Calculate final stats
    final int totalQuestions =
        _questions.length; // Should be _roundLength usually
    // Assuming simple scoring: 10 pts per correct answer
    // Correct count = _score / 10
    final int correctCount = (_score / 10).round();

    // Calculate elapsed time
    String timeString = "00:00";
    if (_roundStartTime != null) {
      final duration = DateTime.now().difference(_roundStartTime!);
      final minutes = duration.inMinutes.toString().padLeft(2, '0');
      final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
      timeString = "$minutes:$seconds";
    }

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final scheme = Theme.of(context).colorScheme;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Dialog(
          backgroundColor: scheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header (Simulated App Bar Title in Modal)
                  const SizedBox(height: 8),
                  Text(
                    'BLAAN TO TAGALOG QUIZ',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Great job!',
                    style: TextStyle(
                      color: scheme.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Stats Rows
                  _buildStatRow('Questions', '$totalQuestions'),
                  const SizedBox(height: 8),
                  _buildStatRow('Correct', '$correctCount'),
                  const SizedBox(height: 8),
                  _buildStatRow('Time', timeString),

                  const SizedBox(height: 32),

                  // Score Circle
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black26
                          : scheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$correctCount/$totalQuestions',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: scheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Score: $_score pts',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: scheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  Text(
                    'You finished this round.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: scheme.onSurface,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Keep practicing Blaan to Tagalog words to\nimprove your score.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Buttons
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (mounted) {
                          setState(() {
                            _setupRound();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: scheme.primary,
                        foregroundColor: scheme.onPrimary,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Play again',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Call the quit callback if provided
                        widget.onQuit?.call();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark
                            ? Colors
                                  .black // Dark button in dark mode
                            : scheme
                                  .surfaceContainerHighest, // Light Green in light mode
                        foregroundColor: isDark
                            ? Colors
                                  .white // White text in dark mode
                            : const Color(
                                0xFF166534,
                              ), // Dark Green text in light mode
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Quit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;
    final _Question q = _questions[_currentIndex];

    // Calculate Grid item size
    // We want 2 items per row, with spacing.
    // Screen width - padding.
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Game',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: scheme.onSurface,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Row: Question # - Timer - Score
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Questions Left
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'QUESTION',
                        style: TextStyle(
                          color: scheme.onSurfaceVariant,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${_currentIndex + 1}/${_questions.length}',
                        style: TextStyle(
                          color: scheme.primary, // Green
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Timer (Centered roughly)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _togglePause,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                value: _timeLeft / 10.0,
                                backgroundColor: scheme.surfaceContainerHighest,
                                color: scheme.primary,
                                strokeWidth: 5,
                              ),
                            ),
                            // Show pause icon if paused, otherwise time
                            if (_paused)
                              Icon(
                                Icons.play_arrow,
                                color: scheme.primary,
                                size: 32,
                              )
                            else
                              Text(
                                '$_timeLeft',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: scheme.onSurface,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Score
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'SCORE',
                        style: TextStyle(
                          color: scheme.onSurfaceVariant,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$_score',
                        style: TextStyle(
                          color: scheme.primary, // Green
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // The Question Card
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: scheme.outlineVariant.withOpacity(0.8),
                    width: 1,
                  ),
                ),
                color: scheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        'Translate to Blaan',
                        style: TextStyle(
                          color: scheme.onSurfaceVariant,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        q.prompt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: scheme.onSurface,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Answer Choices Grid
              // We'll use a Column with 2 Rows to simulate grid for better control or GridView
              // Since it's fixed 4 options, manual rows are fine and robust.
              Row(
                children: [
                  Expanded(child: _buildOptionButton(context, q, 0)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildOptionButton(context, q, 1)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildOptionButton(context, q, 2)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildOptionButton(context, q, 3)),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, _Question q, int index) {
    if (index >= q.options.length) return const SizedBox.shrink();

    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool isCorrect = index == q.correctIndex;
    final bool isSelected = _selectedIndex == index;

    // Default Style
    Color bgColor = Colors.transparent;
    Color borderColor = scheme.outlineVariant;
    Color textColor = scheme.onSurface;

    if (_showFeedback) {
      if (isSelected && !isCorrect) {
        // Wrong selection: soft red background, strong red text
        bgColor = scheme.error.withOpacity(0.16);
        borderColor = scheme.error;
        textColor = scheme.error;
      } else if (isCorrect) {
        // Correct answer (revealed even if not selected)
        bgColor = scheme.primary.withOpacity(0.16);
        borderColor = scheme.primary;
        textColor = scheme.primary;
      }
    }

    return SizedBox(
      height: 80, // Fixed height for uniformity
      child: OutlinedButton(
        onPressed: () => _onSelect(index),
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          side: BorderSide(color: borderColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          elevation: 0,
        ),
        child: Text(
          q.options[index],
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class _Question {
  const _Question({
    required this.prompt,
    required this.options,
    required this.correctIndex,
  });
  final String prompt;
  final List<String> options;
  final int correctIndex;

  // Create a randomized version of this question
  _Question randomized(Random rng) {
    // Create a list of indices to shuffle
    final indices = List.generate(options.length, (i) => i);
    indices.shuffle(rng);

    // Create new options list based on shuffled indices
    final newOptions = List<String>.generate(
      options.length,
      (i) => options[indices[i]],
    );

    // Find the new correct index after shuffling
    final newCorrectIndex = indices.indexOf(correctIndex);

    return _Question(
      prompt: prompt,
      options: newOptions,
      correctIndex: newCorrectIndex,
    );
  }
}
