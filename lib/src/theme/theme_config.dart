import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  // Couleurs configurables
  static Color primaryColor = Colors.green[50]!;
  static Color secondaryColor = const Color(0xFF000000);
  static Color textColor = Colors.white;

  // Police configurables
  static String fontFamily = 'Lora';

  // Styles de texte configurables
  static TextStyle titleStyle(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double titleFontSize = (size.width / 11).clamp(24.0, 48.0);

    return GoogleFonts.getFont(fontFamily).copyWith(
      fontSize: titleFontSize,
      color: secondaryColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleStyleLarge(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double titleFontSize = (size.width / 12).clamp(22.0, 42.0);

    return GoogleFonts.getFont(fontFamily).copyWith(
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: secondaryColor,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleStyleMedium(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double titleFontSize = (size.width / 20).clamp(18.0, 32.0);

    return GoogleFonts.getFont(fontFamily).copyWith(
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: secondaryColor,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleStyleSmall(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double titleFontSize = (size.width / 50).clamp(14.0, 24.0);

    return GoogleFonts.getFont(fontFamily).copyWith(
      fontSize: titleFontSize,
      fontWeight: FontWeight.bold,
      color: secondaryColor,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textStyleText(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double textFontSize = (size.width / 90).clamp(12.0, 18.0);

    return GoogleFonts.getFont(fontFamily).copyWith(
      fontSize: textFontSize,
      color: textColor,
      decoration: TextDecoration.none,
    );
  }
}

// Thème général
ThemeData appTheme(BuildContext context) {
  return ThemeData(
    primaryColor: ThemeConfig.primaryColor,
    secondaryHeaderColor: ThemeConfig.secondaryColor,
    textTheme: TextTheme(
      headlineLarge: ThemeConfig.titleStyle(context), // Passez directement un TextStyle
    ),
  );
}
