import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData themeEnglish = ThemeData(
    textTheme: TextTheme(
      titleMedium: GoogleFonts.roboto(fontSize: 18),
      titleLarge: GoogleFonts.roboto(fontSize: 20),
      titleSmall: GoogleFonts.roboto(fontSize: 14),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: GoogleFonts.roboto(fontSize: 20, color: Colors.black),
      subtitleTextStyle: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
    ),
    useMaterial3: true,
    bottomAppBarTheme: const BottomAppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
