import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:secondlife/screens/rootscreen.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 80, 40, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.task_alt,
                  size: 45,
                  color: primaryGreenColor,
                ),
                Text(
                  "Thank you for helping the \nenvironment today!",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryGreenColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Image.asset(
              "assets/img/rewardscreen/reward.webp",
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
            SizedBox(height: 20),
            Container(
              height: 90,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 4, // Blur radius
                    offset: Offset(0, 3), // Offset from the container
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "You,ve earned",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "100 ECOINS",
                    style: TextStyle(
                        fontSize: 22,
                        color: primaryGreenColor,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            SizedBox(height: 60),
            CustomLargeButton(
                label: "Go to Homepage",
                onPressed: () {
                  Get.to(() => RootScreen());
                })
          ],
        ),
      ),
    );
  }
}
