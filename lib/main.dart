import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blaan_traslator/translator/translator_screen.dart';
import 'package:blaan_traslator/themes/theme_provider.dart';
import 'package:blaan_traslator/translator/services/hive_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Workaround for volume keys assertion failure in Flutter's HardwareKeyboard.
  // This prevents crashes caused by multiple KeyDownEvents without KeyUpEvents.
  HardwareKeyboard.instance.addHandler((KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.audioVolumeUp ||
        event.logicalKey == LogicalKeyboardKey.audioVolumeDown ||
        event.logicalKey == LogicalKeyboardKey.audioVolumeMute) {
      return true; // Swallow the event to prevent assertion failure
    }
    return false;
  });

  // Initialize Hive database
  await HiveService.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const BlaanTranslatorApp(),
    ),
  );
}

class BlaanTranslatorApp extends StatelessWidget {
  const BlaanTranslatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Blaan Tagalog Dialect Translator',
          theme: themeProvider.themeData,
          debugShowCheckedModeBanner: false,
          home: const TranslatorScreen(),
        );
      },
    );
  }
}
