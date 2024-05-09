import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:secondlife/screens/info_screen/guideScreen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: screenHeight * 0.4,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          height: screenHeight * 0.6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 255, 223),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(45), topLeft: Radius.circular(45)),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Plastic",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      )),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomLargeButton(
                      label: "Recycle it",
                      onPressed: () {
                        Get.to(() => GuideScreen());
                      }),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
