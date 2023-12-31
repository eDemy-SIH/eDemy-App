// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';




class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


class MyThemes {
  static final lightTheme = ThemeData(
      primarySwatch:Colors.green, // changes all colours with respect to given colour
      canvasColor: Color.fromRGBO(238, 238, 238, 1),
      primaryColor: Colors.green,
      cardColor: Color.fromRGBO(0, 202, 153, 1),
      splashColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: const Color.fromARGB(0, 205, 78, 228),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color.fromRGBO(0, 202, 153, 1)),
      ),
      //textTheme: GoogleFonts.workSans()
      
    );

  static final darkTheme = ThemeData(
      primarySwatch: Colors.deepOrange,
      canvasColor: Color.fromRGBO(238, 238, 238, 1),
      cardColor: Color.fromRGBO(48, 63, 159, 1),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.red)
      )
    );
}