// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_taskapp_01/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(_FlutterTaskApp());
}

class _FlutterTaskApp extends StatefulWidget {
  const _FlutterTaskApp({super.key});

  @override
  State<_FlutterTaskApp> createState() => __FlutterTaskAppState();
}

class __FlutterTaskAppState extends State<_FlutterTaskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
