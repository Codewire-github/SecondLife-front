import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/screens/Signup/screens/welcome_screen.dart';

class RecycleScreen extends StatefulWidget {
  const RecycleScreen({super.key});

  @override
  State<RecycleScreen> createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {
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
                "Recycle",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 45,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                "Converting waste materials into new products collecting and processing materials like paper, glass, metal, and plastic to create new items",
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
                        Get.to(() => WelcomeScreen());
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
