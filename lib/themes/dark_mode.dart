import 'package:flutter/material.dart';

// Modern, cohesive dark theme used across the entire app.
// Charcoal background, soft green accents, and consistent typography.

const _darkBackground = Color.fromARGB(255, 31, 31, 31); // App background
const _darkSurface = Color.fromARGB(255, 31, 31, 31); // Cards / sheets
const _darkSurfaceHigh = Color.fromARGB(255, 46, 46, 46); // Elevated cards / containers
const _accentPrimary = Color(0xFF22C55E); // Emerald green
const _accentSecondary = Color(0xFF4ADE80); // Soft green accent
const _borderColor = Color(0xFF4B5563);

final ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
  colorScheme: const ColorScheme.dark(
    primary: _accentPrimary,
    onPrimary: Colors.white,
    secondary: _accentSecondary,
    onSecondary: Colors.black,
    background: Color.fromARGB(255, 20, 20, 20),
    onBackground: Colors.white,
    surface: Color.fromARGB(255, 39, 39, 39),
    onSurface: Colors.white,
    surfaceContainerHighest: _darkSurfaceHigh,
    outline: _borderColor,
    error: Color(0xFFFB7185),
  ),

  // App bar: minimal, clean, with no elevation / tint.
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Cards: subtle border, soft radius, light shadow only when explicitly used.
  cardTheme: CardThemeData(
    color: _darkSurface,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.white.withOpacity(0.04)),
    ),
  ),

  // Buttons: consistent padding, radius, and hover / press feedback.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return _accentPrimary.withOpacity(0.35);
          }
          return _accentPrimary;
        },
      ),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.white.withOpacity(0.10),
      ),
      elevation: MaterialStateProperty.all<double>(0),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.white.withOpacity(0.08),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (states) {
          final base = _borderColor.withOpacity(0.7);
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.hovered)) {
            return BorderSide(color: _accentPrimary, width: 1.4);
          }
          return BorderSide(color: base, width: 1.1);
        },
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(_accentPrimary),
      overlayColor: MaterialStateProperty.all<Color>(
        _accentPrimary.withOpacity(0.12),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _darkSurface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    hintStyle: TextStyle(
      color: Colors.white.withOpacity(0.45),
      fontSize: 14,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.06)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.06)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: _accentPrimary, width: 1.4),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFFB7185)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFFB7185), width: 1.4),
    ),
  ),

  iconTheme: const IconThemeData(color: Colors.white),

  // Bottom sheets (phrases, settings, etc.).
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: _darkSurface,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
  ),

  // Dividers and subtle separators.
  dividerTheme: DividerThemeData(
    color: Colors.white.withOpacity(0.08),
    thickness: 1,
    space: 1,
  ),

  // Snackbars for feedback (recording, copy, errors).
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: _darkSurfaceHigh,
    behavior: SnackBarBehavior.floating,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),

  // Chips (categories, filters, etc.).
  chipTheme: ChipThemeData(
    backgroundColor: _darkSurface,
    disabledColor: _darkSurface.withOpacity(0.5),
    selectedColor: _accentPrimary.withOpacity(0.18),
    secondarySelectedColor: _accentPrimary.withOpacity(0.28),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: _borderColor.withOpacity(0.7)),
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 12.5,
      fontWeight: FontWeight.w500,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 12.5,
      fontWeight: FontWeight.w600,
    ),
    brightness: Brightness.dark,
  ),

  // List tiles (settings items, phrase rows use custom widgets but inherit baseline).
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    iconColor: Colors.white70,
    textColor: Colors.white,
  ),

  // Typography: consistent sizes and weights.
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      height: 1.4,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.5,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1.5,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  ),
);
