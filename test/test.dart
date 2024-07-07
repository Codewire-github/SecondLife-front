import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secondlife/screens/Signup/screens/location_screen.dart';
import 'package:secondlife/screens/info_screen/info_screen.dart';
import 'package:secondlife/screens/info_screen/videosSuggestions.dart';
import 'package:secondlife/screens/signup/screens/avatar_selection.dart';
import 'package:secondlife/screens/signup/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
