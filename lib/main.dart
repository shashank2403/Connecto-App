import 'package:connecto_app/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 192, 34, 255)),
      ),
      home: const EventScreen(),
    );
  }
}
