import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/back_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomBackButton(),
          Text(
            "Please enter your email",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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
                    Get.to(() => {});
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
