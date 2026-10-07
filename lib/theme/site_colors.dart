import 'package:flutter/material.dart';

class SiteColors {
  static const navy = Color(0xFF1B2D5C);
  static const navyDark = Color(0xFF111936);
  static const navBar = Color(0xFF1E2340);
  static const primary = Color(0xFF4C5FE0);
  static const purple = Color(0xFF8B5CF6);
  static const success = Color(0xFF2CB88A);
  static const danger = Color(0xFFE0524A);
  static const warning = Color(0xFFE0A23C);
  static const ink = Color(0xFF161A2B);
  static const muted = Color(0xFF6B7280);
  static const background = Color(0xFFF5F6FA);
  static const surface = Colors.white;
  static const border = Color(0xFFE5E7EF);
  static const progressTrack = Color(0xFFEDEEF3);

  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [navyDark, navy, Color(0xFF2A3C8F)],
  );

  static const accentGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, purple],
  );
}
