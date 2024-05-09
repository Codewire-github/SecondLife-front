import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/widgets/customButtons.dart';

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
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/splashscreen/reduce.png',
                height: MediaQuery.sizeOf(context).height * 0.4,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: secondaryGreenColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ),
              ),
              Text(
                "Reduce",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 45,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                "Lessen the amount of waste produced by consuming fewer products, choosing items with minimal packaging, and being mindful",
                style: TextStyle(
                    color: Color.fromARGB(238, 134, 138, 135),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              CustomLargeButton(
                  label: "Continue",
                  onPressed: () {
                    Get.to(() => const ReuseScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
