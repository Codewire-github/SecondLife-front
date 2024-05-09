import 'package:flutter/material.dart';

class NearestPlaceScreen extends StatefulWidget {
  const NearestPlaceScreen({super.key});

  @override
  State<NearestPlaceScreen> createState() => _NearestPlaceScreenState();
}

class _NearestPlaceScreenState extends State<NearestPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Nearest Places"),
      ),
    );
  }
}
