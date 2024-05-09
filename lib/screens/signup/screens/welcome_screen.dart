import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/screens/Signup/screens/user_type_screen.dart';
import 'package:secondlife/screens/signup/screens/email_verification.dart';
import 'package:secondlife/screens/signup/widgets/custom_text_field.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController emailController = TextEditingController();
  bool isValid = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  void onFieldChanged(bool val) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isValid = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.5,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 122, 186, 120),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45))),
            child: Image.asset("assets/img/loginscreen/welcome.png"),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Welcome to Second Life!",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      letterSpacing: 0.2),
                ),
                SizedBox(
                  height: screenHeight * 0.008,
                ),
                Text(
                  "Welcome to our Recycle App! 🌱 Join us in making a positive impact on the planet by easily sorting and recycling your waste. Let's work together towards a cleaner, greener future! 🌍",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                CustomEmailField(
                  isEmail: true,
                  texteditingController: emailController,
                  errorText: "It must contain '@' & end with '.com'",
                  hintText: "example@gmail.com",
                  onIsValidChanged: onFieldChanged,
                ),
                SizedBox(
                  height: screenHeight * 0.0125,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: isValid ? primaryGreenColor : Colors.grey[400],
                        borderRadius: BorderRadius.circular(22.5)),
                    child: TextButton(
                      onPressed: () {
                        isValid
                            ? Get.to(() => EmailVerificationScreen(
                                  enteredEmailAddress: emailController.text,
                                ))
                            : () {};
                      },
                      child: const Text(
                        "Continue my journey",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  "New to Second Life?",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                SizedBox(
                  height: screenHeight * 0.0125,
                ),
                Container(
                    width: screenWidth * 0.55,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 246, 233, 178),
                        borderRadius: BorderRadius.circular(22.5)),
                    child: TextButton(
                      child: Text(
                        "Start a new journey",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Get.to(() => UserTypeScreen());
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
