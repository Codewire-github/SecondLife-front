import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/back_button.dart';
import 'package:secondlife/common/customButtons.dart';
import 'package:secondlife/screens/Signup/screens/namescreen.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({Key? key}) : super(key: key);

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
      body: Stack(
        children: [
          Column(
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
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => setState(() => selectedRole = 1),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 255, 236),
                    borderRadius: BorderRadius.circular(selectedRole == 1
                        ? 200
                        : 12), // Rounded rectangle when not selected
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              selectedRole == 1 ? 200 : 12),
                          child: Image.asset('assets/img/signupscreen/user.jpg',
                              fit: BoxFit.cover),
                        ),
                      ),
                      if (selectedRole ==
                          1) // Show checkmark icon when selected
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.check_circle,
                              color: Colors.green, size: 40),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "User",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () => setState(() => selectedRole = 2),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 255, 236),
                    borderRadius: BorderRadius.circular(selectedRole == 2
                        ? 200
                        : 12), // Rounded rectangle when not selected
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              selectedRole == 2 ? 200 : 12),
                          child: Image.asset(
                              'assets/img/signupscreen/recycler.jpg',
                              fit: BoxFit.cover),
                        ),
                      ),
                      if (selectedRole ==
                          2) // Show checkmark icon when selected
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.check_circle,
                              color: Colors.green, size: 40),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Recycling Plant / \n Non-profit Organization",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: CustomLargeButton(
                  label: "Continue",
                  onPressed: () {
                    Get.to(() => NameScreen());
                  }),
            ),
          )
        ],
      ),
    );
  }
}
