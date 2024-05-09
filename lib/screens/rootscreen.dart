import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/screens/home_screen/widgets/camerascreen.dart';
import 'package:secondlife/screens/home_screen/widgets/custom_bottom_nav.dart';
import 'package:secondlife/screens/home_screen/widgets/homescreen.dart';
import 'package:secondlife/screens/profile_screen/profile_screen_user.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens() => [
        HomeScreen(),
        ProfileScreenUser(),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.scale(
        scale: 1.5,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => CameraScreen());
          },
          backgroundColor: primaryGreenColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: const BorderSide(
              color: Colors.black,
              width: 5.0,
            ),
          ),
          child: const Icon(Icons.document_scanner_rounded,
              size: 25, color: Colors.white),
        ),
      ),
      body: screens()[selectedIndex],
      bottomNavigationBar: CustomButtonNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
