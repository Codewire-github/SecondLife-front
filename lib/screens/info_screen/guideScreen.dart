import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/widgets/back_button.dart';
import 'package:secondlife/screens/info_screen/videosSuggestions.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int stepNo = 0;
  List<Map<String, String>> responseData = [
    {"title": "Hello"},
    {"title": "Hi"},
    {"title": "Hi"}
  ];

  String getButtonText(int stepNo) {
    if (stepNo == 0) {
      return "Let's get Started";
    } else if (stepNo == responseData.length - 1) {
      return "Done";
    } else {
      return "Next";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomBackButton(),
          Text(
            "Steps for recycling",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(responseData.length, (index) {
                        return Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: index == stepNo
                                ? secondaryGreenColor
                                : const Color.fromARGB(255, 223, 223, 223),
                          ),
                        );
                      }),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          stepNo == responseData.length - 1
                              ? Get.to(() => VideoSuggestionsScreen())
                              : setState(() {
                                  stepNo += 1;
                                });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: stepNo != responseData.length - 1
                                  ? primaryGreenColor
                                  : Colors.black),
                          child: Row(
                            children: [
                              Text(
                                getButtonText(stepNo),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                stepNo == responseData.length - 1
                                    ? Icons.done_rounded
                                    : Icons.east_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
