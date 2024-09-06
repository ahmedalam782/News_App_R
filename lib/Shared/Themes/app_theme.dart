import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color white = Color(0xffFFFFFF);
  static const Color navy = Color(0xff4F5A69);
  static const Color black = Color(0xff303030);
  static const Color gray = Color(0xffA3A3A3);
  static const Color fireRed = Color(0xffC91C22);
  static const Color midnightBlue = Color(0xff003E90);
  static const Color deepPink = Color(0xffED1E79);
  static const Color peru = Color(0xffCF7E48);
  static const Color steelBlue = Color(0xff4882CF);
  static const Color sandBrown = Color(0xffF2D352);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.transparent,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primary,
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: white,
      iconTheme: const IconThemeData(
        size: 30,
        color: white,
      ),
      backgroundColor: primary,
      centerTitle: true,
      titleTextStyle: GoogleFonts.exo(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: navy,
      ),
      titleMedium: GoogleFonts.exo(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: white,
      ),
      labelMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: gray,
      ),
    ),
  );
}
