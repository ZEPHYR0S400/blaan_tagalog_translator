import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0F3D2E), // Deep Forest Green
    onPrimary: Colors.white,
    secondary: Color(0xFF0F3D2E), // Same as primary for consistency in icons
    onSecondary: Colors.white,
    surface: Colors.white, // Pure white background
    onSurface: Colors.black,
    surfaceContainerHighest: Color(
      0xFFE8F5E9,
    ), // Light Mint Green for output card
    outline: Color(0xFFE0E0E0),
    error: Color(0xFFFF5252),
  ),
  scaffoldBackgroundColor: Colors.white, // Pure white background
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(0xFF0F3D2E),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Color(0xFF0F3D2E)),
  ),
  cardTheme: CardThemeData(
    color: Colors.white, // White cards
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(
        color: Color(0xFFEEEEEE), // Subtle border
        width: 1,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF0F3D2E), // Deep Forest Green
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF0F3D2E),
      side: const BorderSide(color: Color(0xFF0F3D2E)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),
);
