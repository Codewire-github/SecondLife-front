import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomButtonNav extends StatefulWidget {
  final Function(int)? onTabChange;
  const CustomButtonNav({super.key, this.onTabChange});

  @override
  State<CustomButtonNav> createState() => _CustomButtonNavState();
}

class _CustomButtonNavState extends State<CustomButtonNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 122, 186, 120),
          borderRadius: BorderRadius.circular(40)),
      margin: const EdgeInsets.fromLTRB(35, 0, 35, 20),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: GNav(
        onTabChange: (value) => widget.onTabChange!(value),
        tabBackgroundColor: Color.fromARGB(255, 243, 202, 82),
        color: Colors.grey[800],
        activeColor: Colors.black,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        tabs: const [
          GButton(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            icon: Icons.home_outlined,
            text: "Home",
            gap: 8,
          ),
          GButton(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            icon: Icons.person_outline_rounded,
            text: "Profile",
            gap: 8,
          )
        ],
      ),
    );
  }
}
