import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/widgets/back_button.dart';

import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:secondlife/screens/signup/screens/email_verification.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomBackButton(),
            Container(
                height: MediaQuery.sizeOf(context).height * 0.52,
                child: Image.asset("assets/img/signupscreen/email.png")),
            Text(
              "Please enter your email",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
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
                      hintText: 'example@gmail.com',
                      hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 187, 186, 186))),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: CustomLargeButton(
                label: "Continue",
                onPressed: () {
                  Get.to(
                      () => EmailVerificationScreen(enteredEmailAddress: ""));
                }),
          ),
        )
      ]),
    );
  }
}
