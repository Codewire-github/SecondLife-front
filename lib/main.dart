import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/screens/Splash/screens/splashscreen1.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: Platform.isAndroid
            ? GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            : null,
      ),
      debugShowCheckedModeBanner: false,
      home: ReduceScreen(),
    );
  }
}
