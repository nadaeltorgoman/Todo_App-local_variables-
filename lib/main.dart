import 'package:flutter/material.dart';
import 'package:todo_app/Screens/on_boarding_screen.dart';

import 'Resources/color_pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subul TO DO App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: ColorsPalette.whiteColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                minimumSize: const Size(215, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ))),
      ),
      home: const OnBoardingScreen(),
    );
  }
}