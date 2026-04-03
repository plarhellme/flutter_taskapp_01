// ignore_for_file: unused_import, unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_taskapp_01/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zbynmngavvjfpkbetvmw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpieW5tbmdhdnZqZnBrYmV0dm13Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUyMDc4OTMsImV4cCI6MjA5MDc4Mzg5M30.E0i1eKmtXCRu2-JQWyuSu6aYMf5gVK4CJtqadAxw-3Y',
  );
  runApp(
    _FlutterTaskApp(),
  );
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
