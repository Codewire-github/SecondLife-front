import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/widgets/back_button.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:secondlife/screens/Signup/screens/emailscreen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomBackButton(),
            Container(
                height: MediaQuery.sizeOf(context).height * 0.54,
                child: Image.asset("assets/img/signupscreen/location.png")),
            Text(
              "Where are you located ?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 10, 150, 71), width: 3),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  //controller: _controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 30, right: 18, top: 18, bottom: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none, // Increased border width
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter your location here',
                      hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 187, 186, 186))),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: CustomLargeButton(
                    label: "Continue",
                    onPressed: () {
                      Get.to(() => EmailScreen());
                    }),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
