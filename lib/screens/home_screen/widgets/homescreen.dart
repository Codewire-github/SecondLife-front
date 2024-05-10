import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/dummy_data.dart';
import 'package:secondlife/common/widgets/coupon.dart';
import 'package:secondlife/local_storage/const.dart';
import 'package:secondlife/screens/home_screen/screens/chatbot_screen.dart';
import 'package:secondlife/screens/home_screen/screens/nearest_place_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> actionsList = [
    {
      "title": "Find Nearest Places",
      "icon": Icons.explore_rounded,
      "onPressed": () {
        Get.to(() => const NearestPlaceScreen());
      },
    },
    {
      "title": "Ask Questions",
      "icon": Icons.forum_rounded,
      "onPressed": () {
        Get.to(() => const AskQuestionScreen());
      }
    },
  ];

  int? avatarOption;
  String? username = "";
  String? useremail = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final loadedUsername = await storage.read(key: name) ?? "";
    final loadedUseremail = await storage.read(key: email) ?? "";
    final loadedAvatarOption = await storage.read(key: avatar) ?? "";

    setState(() {
      username = loadedUsername;
      useremail = loadedUseremail;
      avatarOption = int.parse(loadedAvatarOption);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: primaryGreenColor, width: 2.5),
                  ),
                  child: ClipOval(
                    child: Image.asset("assets/img/avatars/$avatarOption.png"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome,",
                  style: TextStyle(fontSize: 22, color: Colors.grey[700]),
                ),
                SizedBox(width: 10),
                Text(
                  "$username",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Stores, Coupons and Rewards",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    couponData.length,
                    (index) {
                      Map<String, dynamic> data = couponData[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: couponCard(
                          context,
                          data['couponName'],
                          data['discount'],
                          data['couponCode'],
                          data['daysLeft'],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            const Text(
              "Activities",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Container(
              alignment: Alignment.center,
              child: Wrap(
                spacing: 15,
                runSpacing: 10.0,
                children: actionsList.asMap().entries.map((entry) {
                  Map<String, dynamic> action = entry.value;
                  return GestureDetector(
                    onTap: () {
                      action["onPressed"](); // Execute onPressed function
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 255, 249),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            action["icon"], // Use icon from the action map
                            size: 30,
                            color: secondaryGreenColor,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            action["title"],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
