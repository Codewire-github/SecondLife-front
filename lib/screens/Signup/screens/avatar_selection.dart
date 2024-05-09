import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/widgets/back_button.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:secondlife/screens/Signup/screens/emailscreen.dart';

class AvatarSelection extends StatefulWidget {
  const AvatarSelection({Key? key}) : super(key: key);

  @override
  State<AvatarSelection> createState() => _AvatarSelectionState();
}

class _AvatarSelectionState extends State<AvatarSelection> {
  int selectedAvatar = 0;

  List<String> avatarImg = [
    'assets/img/avatars/1.png',
    'assets/img/avatars/2.png',
    'assets/img/avatars/3.png',
    'assets/img/avatars/4.png',
    'assets/img/avatars/5.png',
    'assets/img/avatars/6.png',
    'assets/img/avatars/7.png',
    'assets/img/avatars/8.png',
    'assets/img/avatars/9.png',
    'assets/img/avatars/10.png',
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          const CustomBackButton(),
          const Text(
            "Choose your Avatar",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
          ),
          SizedBox(height: screenHeight * 0.05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 10.0,
                    children: avatarImg.asMap().entries.map((entry) {
                      int index = entry.key;
                      String avatar = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAvatar = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: selectedAvatar == index
                              ? screenWidth * 0.3
                              : screenWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: selectedAvatar == index
                                  ? Color.fromARGB(255, 122, 186, 120)
                                  : Colors.black,
                            ),
                          ),
                          child: Image.asset(avatar),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                    height: screenHeight *
                        0.1), // Optional space between avatars and button
                CustomLargeButton(
                    label: "Continue",
                    onPressed: () {
                      Get.to(() => EmailScreen());
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
