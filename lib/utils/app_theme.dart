import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  var theme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.russoOne(),
      bodyLarge: GoogleFonts.russoOne(),
      bodyMedium: GoogleFonts.russoOne(),
      bodySmall: GoogleFonts.russoOne(),
      headlineLarge: GoogleFonts.russoOne(),
      headlineMedium: GoogleFonts.russoOne(),
      headlineSmall: GoogleFonts.russoOne(),
      titleLarge: GoogleFonts.russoOne(),
      titleMedium: GoogleFonts.russoOne(),
      titleSmall: GoogleFonts.russoOne(),
      labelSmall: GoogleFonts.russoOne(),
      displaySmall: GoogleFonts.russoOne(),
      displayMedium: GoogleFonts.russoOne(),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(229, 190, 236,1),
      onPrimary: Colors.white,
      secondary: Color.fromRGBO(145, 127, 179,1),
      onSecondary: Colors.white,
      error: Color.fromRGBO(145, 127, 179,1),
      onError: Color.fromRGBO(145, 127, 179,1),
      background: Color.fromRGBO(145, 127, 179,1),
      onBackground: Color.fromRGBO(145, 127, 179,1),
      surface: Color.fromRGBO(145, 127, 179,1),
      onSurface: Color.fromRGBO(145, 127, 179,1),
    )
  );