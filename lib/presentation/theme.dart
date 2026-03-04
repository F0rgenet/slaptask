import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlapTheme {
  static const background = Color(0xFF0F0F0F);
  static const foreground = Color(0xFFF0F0F0);
  static const card = Color(0xFF171717);
  static const secondary = Color(0xFF1F1F1F);
  static const secondaryForeground = Color(0xFFD4D4D4);
  static const muted = Color(0xFF1F1F1F);
  static const mutedForeground = Color(0xFF737373);
  static const border = Color(0xFF262626);
  static const primary = Color(0xFFE8552D);
  static const primaryForeground = Color(0xFFFAFAFA);
  static const success = Color(0xFF34D399);
  static const successForeground = Color(0xFFFAFAFA);
  static const destructive = Color(0xFFDC2626);
  static const ring = Color(0xFFE8552D);

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.dark(
      surface: background,
      onSurface: foreground,
      primary: primary,
      onPrimary: primaryForeground,
      secondary: secondary,
      onSecondary: secondaryForeground,
      error: destructive,
      outline: border,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w200,
        letterSpacing: -1.2,
        color: foreground,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w200,
        letterSpacing: -1.0,
        color: foreground,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w200,
        letterSpacing: -0.8,
        color: foreground,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w200,
        letterSpacing: -0.5,
        color: foreground,
      ),
      titleLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w300, color: foreground),
      bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, color: foreground, height: 1.5),
      bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: foreground, height: 1.5),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: mutedForeground),
      labelLarge: GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
        color: mutedForeground,
      ),
      labelMedium: GoogleFonts.jetBrainsMono(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: mutedForeground,
      ),
      labelSmall: GoogleFonts.jetBrainsMono(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.0,
        color: mutedForeground,
      ),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: background, surfaceTintColor: Colors.transparent, elevation: 0),
    dividerTheme: const DividerThemeData(color: border, thickness: 1),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: secondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: ring, width: 1),
      ),
      hintStyle: GoogleFonts.inter(color: mutedForeground.withValues(alpha: 0.5), fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
  );
}
