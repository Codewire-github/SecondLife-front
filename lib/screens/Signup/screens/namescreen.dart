import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/back_button.dart';
import 'package:secondlife/screens/Signup/screens/emailscreen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomBackButton(),
          Text(
            "What's your name ?",
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
                    hintText: 'Enter your name here',
                    hintStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w300)),
              ),
            ),
          ),
          Container(
              height: 55,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                color: Color.fromARGB(255, 10, 150, 71),
              ),
              child: TextButton(
                  onPressed: () {
                    Get.to(() => EmailScreen());
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )))
        ],
      ),
    );
  }
}
