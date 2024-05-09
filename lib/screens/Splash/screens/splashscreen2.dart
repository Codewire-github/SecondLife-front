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
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reuse",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 45,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                "Finding new ways to use instead of throwing away by repairing, donating or selling items, and finding ways to extend the life of products",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.5),
                    color: Color.fromARGB(255, 10, 150, 71),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => RecycleScreen());
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
