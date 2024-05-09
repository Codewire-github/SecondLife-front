import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
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
              Image.asset(
                'assets/img/splashscreen/reuse.png',
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
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(width: 5),
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
                    )
                  ],
                ),
              ),
              Text(
                "Reuse",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 45,
                    fontWeight: FontWeight.w600),
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
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              CustomLargeButton(
                  label: "Continue",
                  onPressed: () {
                    Get.to(() => const RecycleScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
