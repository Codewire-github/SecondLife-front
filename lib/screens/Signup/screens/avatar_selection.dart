import 'package:flutter/material.dart';
import 'package:secondlife/common/back_button.dart';

class AvatarSelection extends StatefulWidget {
  const AvatarSelection({super.key});

  @override
  State<AvatarSelection> createState() => _AvatarSelectionState();
}

class _AvatarSelectionState extends State<AvatarSelection> {
  int selectedAvatar = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [CustomBackButton(), Text("Hello world"), Container()],
      ),
    );
  }
}
