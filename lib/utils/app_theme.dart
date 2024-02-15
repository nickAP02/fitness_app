import 'package:fitness_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  class AppTheme {
    
    static final ThemeData theme = ThemeData(
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
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryTextColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.primaryTextColor,
        error: AppColors.secondaryColor,
        onError: AppColors.errorColor,
        background: Color.fromRGBO(145, 127, 179,1),
        onBackground: AppColors.primaryTextColor,
        surface: AppColors.primaryColor,
        onSurface: AppColors.primaryTextColor,
      )
    );
  }