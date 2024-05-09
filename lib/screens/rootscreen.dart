import 'package:flutter/material.dart';
import 'package:secondlife/screens/home_screen/widgets/custom_bottom_nav.dart';
import 'package:secondlife/screens/home_screen/widgets/homescreen.dart';
import 'package:secondlife/screens/profile_screen/profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 1;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens() => [
        HomeScreen(),
        ProfileScreen(),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens()[selectedIndex],
      bottomNavigationBar: CustomButtonNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
