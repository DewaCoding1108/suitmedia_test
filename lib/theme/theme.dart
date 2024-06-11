import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppTheme {
  static const primaryColor = Color.fromRGBO(43, 99, 123, 1);

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: Colors.white,
      foregroundColor: Colors.black,
      elevation: .5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // primary: Colors.white,
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w500, color:const Color(0x6867775C), height: 1.5
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
    textTheme: TextTheme(

      titleMedium: GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black, height: 2.0, 
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black, 
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black, 
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black, 
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black, 
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white, 
      )
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}