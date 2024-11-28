import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/src/constants/colors.dart';


// class AppTheme {
//   AppTheme._();
//     static ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     appBarTheme : AppBarTheme.lightAppBarTheme,
//     textTheme : TextTheme.lightTextTheme,
//     elevatedButtonTheme : ElevatedButtonTheme.lightElevatedButtonTheme,
//     outlinedButtonTheme : OutlinedButtonTheme.lightoutlinedButtonTheme ,
//     inputDecorationTheme : InputDecorationTheme.lightInputDecorationTheme,

//     );
//   static ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     appBarTheme: AppBarTheme.darkAppBarTheme,
//     textTheme: TextTheme.darkTextTheme,
//     elevatedButtonTheme: ElevatedButtonTheme.darkElevatedButtonTheme,
//     outlinedButtonTheme: OutlinedButtonTheme.darkoutlinedButtonTheme,
//     inputDecorationTheme: InputDecorationTheme.darkInputDecorationTheme,
//   );

// }

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: Colors.grey[300],
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: AppBarTheme(
      color: lightAppBarColor,
      centerTitle: true, // Center the title
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: lightHeadingColor, // Title text color
      ),
      iconTheme: IconThemeData(color: Colors.black), // Icon color
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.grey[200],
      elevation: 16,
    ),
    // iconButtonTheme: IconButtonThemeData(
    //     style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.all(Colors.black),
    // )),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      displayMedium: GoogleFonts.montserrat(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
      displaySmall: GoogleFonts.montserrat(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      headlineLarge: GoogleFonts.roboto(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
      headlineMedium: GoogleFonts.roboto(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      headlineSmall: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      labelLarge: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
      labelMedium: GoogleFonts.poppins(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87),
      labelSmall: GoogleFonts.poppins(
          fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black54),
      bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
      bodyMedium: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
      bodySmall: GoogleFonts.poppins(fontSize: 10, color: Colors.black54),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: whiteColor,
        backgroundColor: secondaryColor,
        side: BorderSide(color: secondaryColor),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: Colors.white,
    //     textStyle: GoogleFonts.poppins(
    //       fontSize: 16,
    //       fontWeight: FontWeight.w500,
    //       color: Colors.white,
    //     ),
    //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //   ),
    // ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: secondaryColor,
        side: BorderSide(color: secondaryColor),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     backgroundColor: Colors.white,
    //     side: BorderSide(color: Colors.grey),
    //     textStyle: GoogleFonts.poppins(
    //       fontSize: 14,
    //       fontWeight: FontWeight.w500,
    //       color: Colors.black,
    //     ),
    //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //   ),
    // ),

    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: secondaryColor,
        floatingLabelStyle: TextStyle(color: secondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: secondaryColor),
        )),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor: Colors.white,
    //   filled: true,
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.grey),
    //   ),
    //   prefixIconColor: lightLabelColor,
    //   labelStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   hintStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w500,
    //   ),
    // ),
    cardTheme: CardTheme(
      color:  Colors.grey[300],
      shadowColor:Colors.white , 
      elevation: 4, // Elevation for card shadow
      margin: EdgeInsets.all(8),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBgColor,
    appBarTheme: AppBarTheme(
      color: darkAppBarColor,
      centerTitle: true, // Center the title
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Title text color
      ),
      iconTheme: IconThemeData(color: Colors.white), // Icon color
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.grey[200],
      elevation: 16,
    ),
    // iconButtonTheme: IconButtonThemeData(
    //     style: ButtonStyle(
    //   backgroundColor: MaterialStateProperty.all(Colors.white),
    // )),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: GoogleFonts.montserrat(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
      displaySmall: GoogleFonts.montserrat(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      headlineLarge: GoogleFonts.roboto(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
      headlineMedium: GoogleFonts.roboto(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      headlineSmall: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      labelLarge: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white70),
      labelMedium: GoogleFonts.poppins(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70),
      labelSmall: GoogleFonts.poppins(
          fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white60),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 14, color: Colors.white70),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 12, color: Colors.white70),
      bodySmall: GoogleFonts.poppins(
        fontSize: 10, color: Colors.white60),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: secondaryColor,
        backgroundColor: whiteColor,
        side: BorderSide(color: secondaryColor),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: Color(0xff34374B),
    //     // backgroundColor: Colors.transparent,

    //     textStyle: GoogleFonts.poppins(
    //       fontSize: 16,
    //       fontWeight: FontWeight.w500,
    //       color: Colors.white54,
    //     ),
    //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //       side: BorderSide(color: Colors.grey), // Add border here
    //     ),
    //   ),
    // ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        // foregroundColor: Color(0xff34374B),
        backgroundColor: Colors.transparent,
        textStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: whiteColor,
        side: BorderSide(color: whiteColor),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: OutlinedButton.styleFrom(
    //     // foregroundColor: Color(0xff34374B),
    //     backgroundColor: Color(0xff34374B),
    //     side: BorderSide(color: Colors.white),
    //     textStyle: GoogleFonts.poppins(
    //       fontSize: 14,
    //       fontWeight: FontWeight.w500,
    //     ),
    //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //     shape: RoundedRectangleBorder(
    //         side: BorderSide(color: Colors.white),
    //         borderRadius: BorderRadius.circular(12)),
    //   ),
    // ),

    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: primaryColor,
        floatingLabelStyle: TextStyle(color: primaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: primaryColor),
        )),
    // inputDecorationTheme: const InputDecorationTheme(
    //   fillColor: darkBgColor,
    //   filled: true,
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.white),
    //   ),
    //   prefixIconColor: darkLabelColor,
    //   labelStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: darkFontColor,
    //     fontWeight: FontWeight.w500,
    //   ), // TextStyle
    //   hintStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: darkFontColor,
    //     fontWeight: FontWeight.w500,
    //   ), // TextStyle
    // ),
    cardTheme: CardTheme(
      color: darkCardColor, // Dark background color for the card
      shadowColor: Colors.black.withOpacity(0.6), // Shadow color
      elevation: 4,
      margin: EdgeInsets.all(8),
    ),
  );
}



// import 'package:flutter/material.dart';
// import 'text_field_theme.dart';

// class AppTheme {
//   AppTheme._();

//   static ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light , 
//     textTheme: TextTheme.lightTextTheme , 
//     elevatedButtonTheme: ElevatedButtonTheme.lightElevatedButtonTheme , 
//     outlinedButtonTheme: OutlinedButtonTheme.lightOutlinedButtonTheme , 
//     inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme , 
//   );

//   static ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark , 
//     textTheme: TextTheme.darkTextTheme , 
//     elevatedButtonTheme: ElevatedButtonTheme.darkElevatedButtonTheme , 
//     outlinedButtonTheme: OutlinedButtonTheme.darkOutlinedButtonTheme , 
//     inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme , 
//   );
// }
