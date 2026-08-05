import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      appBarTheme: const AppBarTheme(centerTitle: true),
    );
  }
}
