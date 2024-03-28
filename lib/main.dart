import 'package:flutter/material.dart';
import 'package:forzar_4g/src/core/theme/theme_data.dart';
import 'package:forzar_4g/src/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forzar 4G",
      debugShowCheckedModeBanner: false,
      theme: const AppTheme().getTheme(),
      home: const HomeScreen(),
    );
  }
}
