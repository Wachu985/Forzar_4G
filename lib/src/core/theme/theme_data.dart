import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.deepPurple,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.purple,
  Colors.red,
  Colors.pink,
  Colors.orange,
  Colors.indigo,
  Colors.yellow,
  Colors.deepOrange
];

class AppTheme {
  final int selectedColor;
  final bool darkMode;
  final bool useMaterial3;

  const AppTheme(
      {this.useMaterial3 = true,
      this.selectedColor = 1,
      this.darkMode = false});
  ThemeData getTheme() => ThemeData(
        useMaterial3: useMaterial3,
        colorSchemeSeed: colorList[selectedColor],
        brightness: darkMode ? Brightness.dark : Brightness.light,
      );
}
