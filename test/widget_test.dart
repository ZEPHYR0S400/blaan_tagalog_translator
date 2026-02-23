// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:blaan_traslator/main.dart';
import 'package:blaan_traslator/themes/theme_provider.dart';
import 'package:blaan_traslator/translator/services/hive_service.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Initialize Hive for the test
    // Note: In a real test environment, you might want to mock the path_provider
    // or use a temporary directory for Hive.
    // For this smoke test, we'll attempt to initialize it as the app does.
    await HiveService.initialize();
  });

  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We must wrap the app in the necessary providers that main() usually provides.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const BlaanTranslatorApp(),
      ),
    );

    // Verify that the app builds successfully and shows the main screen title.
    // Note: Since the app loads data which might be async, we just check if it pumped.
    expect(find.byType(BlaanTranslatorApp), findsOneWidget);

    // We can also check for static text that appears on the home screen
    expect(find.text('Blaan Tagalog Translator'), findsOneWidget);
  });
}
