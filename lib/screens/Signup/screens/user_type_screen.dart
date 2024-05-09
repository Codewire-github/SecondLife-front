import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/back_button.dart';
import 'package:secondlife/screens/Signup/screens/namescreen.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  int selectedRole = 1;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomBackButton(),
            ],
          ),
          Text(
            "Please choose your role",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () => {},
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(200)),
            ),
          ),
          Text("User"),
          SizedBox(height: 20),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(color: Colors.red[50]),
          ),
          Text("Recycler"),
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
                    Get.to(() => NameScreen());
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
