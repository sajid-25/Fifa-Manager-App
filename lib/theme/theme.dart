import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.black, // Prevents white flash during navigation
  brightness: Brightness.dark, // Ensures dark mode
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // Smooth fade transition on Android
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(), // iOS transition style
    },
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    surface: Colors.black,
    onSurface: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white, fontSize: 20),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity, // Prevents layout issues
);
