import 'package:flutter/material.dart';

ThemeData getAppTheme(bool isDarkTheme) {
  return isDarkTheme ? darkTheme() : lightTheme();
}

ThemeData darkTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Color(0xff36313C),
      primaryColorDark: Colors.black,
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Color(0xff473C4F),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      cardTheme: CardTheme(
        color: Color(0xff473C4F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Color.fromARGB(255, 60, 59, 59),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: 10, color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff473C4F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 208, 204, 204),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Color(0xff473C4F),
      ),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 208, 204, 204)),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Color(0xff473C4F)));
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xffffffff),
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromARGB(255, 235, 152, 152),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Color(0xffffffff),
      ),
      iconTheme: IconThemeData(color: Colors.purple));
}
