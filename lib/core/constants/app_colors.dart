import 'package:flutter/material.dart';

/// AppColors - Central place for all colors in the app
/// 
/// WHY: Colors define your brand identity. Having them in one place:
/// - Easy to change brand colors
/// - Consistent throughout the app
/// - Can support dark/light themes later
class AppColors {

  AppColors._();
  // Brand Colors
  // WHY: These represent your brand - choose wisely!
  static const Color primary = Color(0xFF4CAF50);     // Fresh green - represents healthy food
  static const Color primaryDark = Color(0xFF388E3C);  // Darker version for pressed states
  static const Color primaryLight = Color(0xFFC8E6C9); // Light version for backgrounds
  
  // Secondary Colors
  static const Color secondary = Color(0xFFFF6B6B);    // Appetizing red
  static const Color accent = Color(0xFFFFA94D);        // Warm orange for highlights
  
  // Neutral Colors - Used throughout the app
  static const Color background = Color(0xFFF5F5F5);    // Light grey background
  static const Color surface = Color(0xFFFFFFFF);       // White surface for cards
  static const Color error = Color(0xFFE53935);         // Red for errors
  static const Color success = Color(0xFF4CAF50);       // Green for success
  static const Color warning = Color(0xFFFFA726);       // Orange for warnings
  
  // Text Colors - Different levels of importance
  static const Color textPrimary = Color(0xFF1A1A1A);    // Main text - high contrast
  static const Color textSecondary = Color(0xFF757575);  // Secondary text - medium
  static const Color textLight = Color(0xFFBDBDBD);      // Light text - disabled/hints
  
  // Food Category Colors - Makes food types visually distinct
  static const Color fruits = Color(0xFFFF6B6B);         // Red for fruits
  static const Color vegetables = Color(0xFF4CAF50);     // Green for veggies
  static const Color protein = Color(0xFFFFA94D);        // Orange for protein
  static const Color grains = Color(0xFFFFD93D);         // Yellow for grains
  static const Color dairy = Color(0xFF74B9FF);          // Blue for dairy
}