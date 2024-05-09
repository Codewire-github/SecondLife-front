import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/screens/Splash/screens/splashscreen2.dart';

class ReduceScreen extends StatefulWidget {
  const ReduceScreen({super.key});

  @override
  State<ReduceScreen> createState() => _ReduceScreenState();
}

class _ReduceScreenState extends State<ReduceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reduce",
                style: TextStyle(
                    color: Color.fromARGB(255, 116, 117, 116),
                    fontSize: 45,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                "Lessen the amount of waste produced by",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135), fontSize: 16),
              ),
              Text(
                "consuming fewer products, choosing items with",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135), fontSize: 16),
              ),
              Text(
                "minimal packaging, and being mindful",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135), fontSize: 16),
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
                        Get.to(
                          ReuseScreen(),
                        );
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