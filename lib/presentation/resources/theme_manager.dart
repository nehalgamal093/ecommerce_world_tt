import 'package:flutter/material.dart';

ThemeData getAppTheme(bool isDarkTheme) {
  return isDarkTheme ? darkTheme() : lightTheme();
}

ThemeData darkTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColorDark: Colors.black,
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      // cardTheme: CardTheme(
      //   color: Color.fromARGB(255, 23, 23, 23),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   shadowColor: Color.fromARGB(255, 60, 59, 59),
      // ),
      textTheme: TextTheme(
        bodySmall: TextStyle(fontSize: 10, color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ));
}

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: Colors.white,
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    cardTheme: CardTheme(
        color: Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: const Color.fromARGB(255, 205, 201, 201)),
  );
}
