import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getAppTheme(bool isDarkTheme) {
  return isDarkTheme ? darkTheme() : lightTheme();
}

ThemeData darkTheme() {
  return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 31, 25, 46),
      primaryColorDark: const Color.fromARGB(255, 43, 35, 63),
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 43, 35, 63),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        color: const Color.fromARGB(255, 43, 35, 63),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: const Color.fromARGB(255, 165, 163, 163),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: 10, color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 43, 35, 63),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 208, 204, 204),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 43, 35, 63),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 208, 204, 204),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xff473C4F),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: ColorManager.medGrey),
        filled: true,
        fillColor: Color.fromARGB(255, 43, 35, 63),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(207, 215, 213, 212),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(207, 215, 213, 212),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(207, 215, 213, 212),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 52, 37, 93),
          ),
          shadowColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 159, 151, 180),
          ),
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color.fromARGB(255, 43, 35, 63),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 43, 35, 63)),
      )),
      listTileTheme: const ListTileThemeData(iconColor: Colors.white));
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
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 10, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    cardTheme: CardTheme(
        elevation: 3,
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: const Color.fromARGB(255, 233, 233, 233)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffffffff),
      selectedItemColor: Colors.black,
      unselectedItemColor: Color.fromARGB(255, 235, 152, 152),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xffffffff),
    ),
    iconTheme: const IconThemeData(color: Colors.purple),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: ColorManager.medGrey),
      filled: true,
      fillColor: Color.fromARGB(255, 255, 255, 255),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(207, 241, 241, 241),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(207, 241, 241, 241),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(207, 241, 241, 241),
        ),
      ),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color.fromARGB(255, 240, 152, 44)),
  );
}
