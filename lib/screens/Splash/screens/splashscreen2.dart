import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/screens/Splash/screens/splashscreen3.dart';

class ReuseScreen extends StatefulWidget {
  const ReuseScreen({super.key});

  @override
  State<ReuseScreen> createState() => _ReuseScreenState();
}

class _ReuseScreenState extends State<ReuseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reuse",
                style: TextStyle(
                    color: Color.fromARGB(255, 116, 117, 116),
                    fontSize: 45,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                "Finding new ways to use instead of throwing away",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135),
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "by repairing, donating or selling items, ",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135),
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "and finding ways to extend the life of products",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135),
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20),
              Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 10, 150, 71),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(RecycleScreen());
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
